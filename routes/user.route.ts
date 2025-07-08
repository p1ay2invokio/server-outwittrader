import { Router, Request, Response, request, raw } from "express";
import { AppDataSource } from "../AppDataSource";
import { UserEntity } from "../entities/user.entity";
import jwt from 'jsonwebtoken'
import { TokenMiddleware } from "../middleware/TokenMiddleware";
import fs from 'fs'

import multer from 'multer'
import { TeamsEntity } from "../entities/teams.entity";
import { OrderEntity } from "../entities/orders.entity";

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
    let { username, password, email, phone_number } = req.body

    console.log(username, password, email, phone_number)

    if (username && password) {
        const user: [] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where("user.username = :username", { username: username }).execute()

        if (user && user.length > 0) {
            res.status(409).send({ already_username: true })
        } else {
            console.log("INSERTING....")
            const inserted = await AppDataSource.createQueryBuilder().insert().into(UserEntity).values({ username: username, password: password, email: email, phone_number: phone_number }).execute()
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

route.post("/register_ref", async (req: Request, res: Response) => {
    let { username, password, email, phone_number, referral } = req.body


    console.log("Check Ref : ", referral)

    if (username && password) {
        const user: [] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where("user.username = :username", { username: username }).execute()


        if (user && user.length > 0) {
            res.status(409).send({ already_username: true })
        } else {
            console.log("INSERTING....")
            const inserted = await AppDataSource.createQueryBuilder().insert().into(UserEntity).values({ username: username, password: password, email: email, phone_number: phone_number, referral_id: referral }).execute()
            console.log(inserted)

            const token = await jwt.sign({ id: inserted.raw[0].id, username: username }, 'play2')

            if (inserted.raw) {

                const owner_ref: UserEntity[] = await AppDataSource.createQueryBuilder().select().from(UserEntity, "user").where({ id: referral }).execute()



                // console.log(owner_ref[0].)

                if (owner_ref && owner_ref.length > 0) {

                    const team_target: TeamsEntity[] = await AppDataSource.createQueryBuilder().select().from(TeamsEntity, 'team').where({ id: owner_ref[0].team_id }).execute()

                    if (team_target && team_target.length > 0) {

                        console.log(team_target)

                        const updated_member = team_target[0].members + 1

                        const updated_members = await AppDataSource.createQueryBuilder().update(TeamsEntity).set({ members: updated_member }).where({ id: team_target[0].id }).execute()

                        res.status(200).send({ register_success: true, token: token })
                    }
                }
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

    console.log(files)

    try {

        let inserted = await AppDataSource.createQueryBuilder().insert().into(TeamsEntity).values(
            {
                team_name: team_name,
                owner_id: id,
                status: 1 //waiting
            }
        ).execute()

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
                face_img: `/slip/rp${id}/${files.face_img[0].filename}`,
                bank_img: `/slip/rp${id}/${files.bank_img[0].filename}`,
                thai_id_img: `/slip/rp${id}/${files.thai_id_img[0].filename}`,
                team_id: inserted.raw[0].id
            }
        ).where({ id: id }).execute()



        res.status(200).send({ updated: true })

    } catch (err) {
        console.log(err)
    }


})

route.patch("/reset_password", async (req: Request, res: Response) => {
    const { email, new_password } = req.body

    // console.log(email, new_password)

    const user: [] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where({ email: email }).execute()

    // console.log(user)

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

    const { days, user_id, kind } = req.body

    // console.log(kind)

    // console.log(days)

    // console.log(user_id)

    // console.log(kind)

    const user:UserEntity[] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where({id: Number(user_id)}).execute()

    // console.log(user)


    await AppDataSource.createQueryBuilder().update(UserEntity).set(kind == 'binary' ? { binary_days: user[0].binary_days + days } : kind == 'forex' ? { forex_days: user[0].forex_days + days } : { total_days: days }).where({ id: user_id }).execute()

    res.status(200).send({ success: true })
})

route.patch("/update_days_all_users", async (req: Request, res: Response) => {
    const { days, kind } = req.body


    const users = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').execute()

    // console.log("KIND : ", kind, days)


    await users.map(async (item: UserEntity) => {

        let test = await AppDataSource.createQueryBuilder().update(UserEntity).set(kind == 'binary' ? { binary_days: item.binary_days + days } : kind == 'forex' ? { forex_days: item.forex_days + days } : { total_days: 0 }).where({ id: item.id }).execute()

        // console.log(test)
    })

    // console.log(users)

    res.status(200).send(users)

    // await AppDataSource.createQueryBuilder().update(UserEntity).set()

})

// route.patch("/update_all", async (req: Request, res: Response) => {

//     const { days } = req.body

//     await AppDataSource.createQueryBuilder().update(UserEntity).set({ total_days: () => `total_days+${days}` }).where("total_days > 0").execute()

//     // await AppDataSource.createQueryBuilder().select().from(UserEntity, "users").where().execute()

//     res.status(200).send({ success: true })
// })


route.get("/dashboard", async (req: Request, res: Response) => {
    const users = await AppDataSource.createQueryBuilder().from(UserEntity, "users").getCount()
    const team_verified = await AppDataSource.createQueryBuilder().from(TeamsEntity, 'teams').where("status = 2").getCount()
    const team_waiting = await AppDataSource.createQueryBuilder().from(TeamsEntity, 'teams').where("status = 1").getCount()
    const ordered = await AppDataSource.createQueryBuilder().from(OrderEntity, "orders").where("status = 1").getCount()
    // console.log(users)

    res.status(200).json({ users_count: users, team_verified: team_verified, team_waiting: team_waiting, order_count: ordered })
})

export default route