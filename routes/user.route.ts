import { Router, Request, Response, request, raw } from "express";
import { AppDataSource } from "../AppDataSource";
import { UserEntity } from "../entities/user.entity";
import jwt from 'jsonwebtoken'
import { TokenMiddleware } from "../middleware/TokenMiddleware";
import fs from 'fs'

import multer from 'multer'
import { TeamsEntity } from "../entities/teams.entity";

const storage = multer.diskStorage({
    destination: (req: any, file, cb) => {

        if (!fs.existsSync(`./uploads/rp${req.id}`)) {
            fs.mkdirSync(`./uploads/rp${req.id}`)
        }

        cb(null, `./uploads/rp${req.id}`)
    },

    filename: (req, file, cb) => {
        const named = new Date().getTime() + '-' + file.fieldname + '.webp'
        cb(null, named)
    }
})

const upload = multer({ storage: storage })

interface User {
    id: number,
    username: string,
    password: string,
    role: number,
    credit: number
}

const route = Router()

route.post("/login", async (req: Request, res: Response) => {
    let { username, password } = req.body

    if (username && password) {
        const user: User[] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where("user.username = :username AND user.password = :password", { username: username, password: password }).execute()

        if (user && user.length > 0) {

            let { password, ...userObject } = user[0]

            const token = await jwt.sign({ ...userObject }, 'play2')

            res.status(200).send({ login_success: true, token: token })
        } else {
            res.status(200).send({ login_success: false })
        }
    } else {
        res.status(400).send("username and password is required")
    }
})

route.post("/register", async (req: Request, res: Response) => {
    let { username, password, email, phone_number, ref } = req.body

    console.log(username, password, email, phone_number)

    if (username && password) {
        const user: [] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where("user.username = :username", { username: username }).execute()

        if (user && user.length > 0) {
            res.status(409).send({ already_username: true })
        } else {
            const inserted = await AppDataSource.createQueryBuilder().insert().into(UserEntity).values({ username: username, password: password, email: email, phone_number: phone_number, }).execute()
            console.log(inserted)

            const token = await jwt.sign({ id: inserted.raw[0].id, username: username }, 'play2')

            if (inserted.raw) {
                res.status(200).send({ register_success: true, token: token })
            }
        }
    } else {
        res.status(400).send("username and password is required")
    }
})

interface TokenInterface extends Request {
    id?: number
}

route.get("/useraccounts", TokenMiddleware, async (req: TokenInterface, res: Response) => {

    const id = req.id

    const user: User[] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where({ id: id }).execute()

    if (user && user.length > 0) {

        const { password, ...userObject } = user[0]

        res.status(200).send({ ...userObject })
    } else {
        res.status(201).send("Unauthorized")
    }
})


route.patch("/update_partner", TokenMiddleware, upload.fields([{ name: 'face_img', maxCount: 1 }, { name: 'bank_img', maxCount: 1 }, { name: 'thai_id_img', maxCount: 1 }]), async (req: TokenInterface, res: Response) => {

    const { name, surname, thai_id, age, gender, bod, job, salary, bank_account, bank_name, team_name } = req.body
    const files: any = req.files

    const id = req?.id

    try {
        await AppDataSource.createQueryBuilder().update(UserEntity).set(
            {
                name: name,
                surname: surname,
                thai_id: thai_id,
                age: age,
                gender: gender,
                bod: bod,
                job: job,
                salary: salary,
                bank_account: bank_account,
                bank_name: bank_name,
                face_img: files.face_img[0].path,
                bank_img: files.bank_img[0].path,
                thai_id_img: files.thai_id_img[0].path
            }
        ).where({ id: id }).execute()

        await AppDataSource.createQueryBuilder().insert().into(TeamsEntity).values(
            {
                team_name: team_name,
                owner_id: id,
                status: 1 //waiting
            }
        ).execute()

        res.status(200).send({ updated: true })

    } catch (err) {
        console.log(err)
    }


})

route.patch("/reset_password", async (req: Request, res: Response) => {
    const { email, new_password } = req.body

    console.log(email, new_password)

    const user: [] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where({ email: email }).execute()

    console.log(user)

    if (user && user.length > 0) {
        const updated = await AppDataSource.createQueryBuilder().update(UserEntity).set({ password: new_password }).where({ email: email }).execute()

        res.status(200).send({ update_success: true })
    }
})

route.get("/user/:id", async (req: Request, res: Response) => {
    const { id } = req.params

    const user = await AppDataSource.createQueryBuilder().select(["id", "username", "total_days"]).from(UserEntity, "user").where({ id: id }).execute()

    res.status(200).send(user)
})

route.patch("/update_days", async (req: Request, res: Response) => {

    const { days, user_id } = req.body

    await AppDataSource.createQueryBuilder().update(UserEntity).set({ total_days: days }).where({ id: user_id }).execute()

    res.status(200).send({ success: true })
})

export default route