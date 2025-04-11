import { Router, Request, Response } from 'express'
import { AppDataSource } from '../AppDataSource'
import { TokenMiddleware } from '../middleware/TokenMiddleware'
import { UserEntity } from '../entities/user.entity'
import { TeamsEntity } from '../entities/teams.entity'


const route = Router()

interface CustomRequest extends Request {
    id?: number
}

route.get("/team", TokenMiddleware, async (req: CustomRequest, res: Response) => {

    const id = req.id


    const data = await AppDataSource.createQueryBuilder()
        .select(["users.id AS user_id", "teams.id AS team_id", "username", "team_name", "status"])
        .from(UserEntity, "users")
        .innerJoin(TeamsEntity, "teams", "teams.id = users.team_id")
        .where("users.id = :id", { id })
        .execute()

    res.status(200).send(data)
})

route.get("/user_team", TokenMiddleware, async (req: Request, res: Response) => {
    //@ts-ignore
    const id = req.id

    const data = await AppDataSource.createQueryBuilder().select().from(UserEntity, "users").innerJoin(TeamsEntity, 'teams', "users.team_id = teams.id").where({ id: id }).execute()

    res.status(200).send(data)
})

route.get("/all_register_partner", async (req: Request, res: Response) => {

    const data = await AppDataSource.createQueryBuilder().select().from(TeamsEntity, 'team').innerJoin(UserEntity, 'users', "team.owner_id = users.id").where({ status: 1 }).execute()

    console.log(data)

    res.status(200).send(data)
})

route.patch("/verify_team_partner", async (req: Request, res: Response) => {

    const { team_id, broker_link } = req.body

    const data = await AppDataSource.createQueryBuilder().update(TeamsEntity).set({ status: 2, broker_link: broker_link }).where({ id: team_id }).execute()

    res.status(200).send({ verified: true })
})

route.post("/broker_money", async (req: Request, res: Response) => {
    const { amount, user_id } = req.body

    const user_data: UserEntity[] = await AppDataSource.createQueryBuilder().select().from(UserEntity, "users").where({ id: user_id }).execute()

    if (user_data && user_data.length > 0) {
        const team_data: TeamsEntity[] = await AppDataSource.createQueryBuilder().select().from(TeamsEntity, "teams").where({ id: user_data[0].team_id }).execute()

        if (team_data && team_data.length > 0) {
            let update_broker_money = team_data[0].broker_money + Number(amount)
            const data = await AppDataSource.createQueryBuilder().update(TeamsEntity).set({ broker_money: update_broker_money }).where({ id: user_data[0].team_id }).execute()

            res.status(200).send({updated_broker_money: true})
        }
    }
})

export default route