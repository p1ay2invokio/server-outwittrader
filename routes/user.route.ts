import { Router, Request, Response, request, raw } from "express";
import { AppDataSource } from "../AppDataSource";
import { UserEntity } from "../entities/user.entity";
import jwt from 'jsonwebtoken'
import { TokenMiddleware } from "../middleware/TokenMiddleware";

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

    if (username && password) {
        const user: [] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where("user.username = :username", { username: username }).execute()

        console.log(user)

        if (user && user.length > 0) {
            res.status(409).send({ already_username: true })
        } else {
            const inserted = await AppDataSource.createQueryBuilder().insert().into(UserEntity).values({ username: username, password: password, email: email, phone_number: phone_number }).execute()

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

export default route