import axios from "axios";
import { Router } from "express";
// import { redis } from "../server";
import { AppDataSource } from "../AppDataSource";
import { ForexEntity } from "../entities/forex.entity";

const router = Router()


router.get("/forex", async (req, res) => {

    let forexDb = await AppDataSource.createQueryBuilder(ForexEntity, 'forex').execute()

    res.status(200).send(forexDb)

})

router.get("/updateForex", async (req, res) => {


    try {
        let forexNews = await axios.get("https://nfs.faireconomy.media/ff_calendar_thisweek.json")
        let cvt_forex = JSON.stringify(forexNews.data)
        let data: object[] = await AppDataSource.createQueryBuilder().select().from(ForexEntity, 'forex').execute()

        if (data && data.length > 0) {
            await AppDataSource.createQueryBuilder().update(ForexEntity).set({ news: cvt_forex }).where({ id: 1 }).execute()
            res.status(200).send({ updateForexNews: true })
        } else {
            await AppDataSource.createQueryBuilder().insert().into(ForexEntity).values({ news: cvt_forex }).execute()
            res.status(200).send({ InsertedForexNews: true })
        }
    } catch (err) {
        console.log(err)
        console.log("Wait 5 minutes for fetch new data")
        res.status(200).send({ updateForexNews: false })
    }
})

export default router