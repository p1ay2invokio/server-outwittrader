import axios from "axios";
import { Router } from "express";
import { redis } from "../server";
import { AppDataSource } from "../AppDataSource";
import { ForexEntity } from "../entities/forex.entity";

const router = Router()


router.get("/forex", async (req, res) => {

    const forexCache = await redis.get("forex")

    if (forexCache) {
        res.status(200).send(JSON.parse(forexCache))
    } else {

        let forexDb = await AppDataSource.createQueryBuilder(ForexEntity, 'forex').execute()

        redis.set('forex', JSON.stringify(forexDb))

        res.status(200).send(forexDb)

    }
})

router.get("/updateForex", async (req, res) => {

    let data: object[] = await AppDataSource.createQueryBuilder().select().from(ForexEntity, 'forex').execute()

    if (data && data.length > 0) {
        try {
            let forexNews = await axios.get("https://nfs.faireconomy.media/ff_calendar_thisweek.json")
            await AppDataSource.createQueryBuilder().update(ForexEntity).set({ news: JSON.stringify(forexNews) }).where({ id: 1 }).execute()
            res.status(200).send({ updateForexNews: true })
        }catch(err){
            console.log("Wait 5 minutes for fetch new data")
        }
    } else {
        res.status(200).send("Explicit data none first row")
    }
})

export default router