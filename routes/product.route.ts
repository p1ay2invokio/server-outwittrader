import express, { Request, Response } from 'express'
import { AppDataSource } from '../AppDataSource'
import { ProductEntity } from '../entities/products.entity'
import { TokenMiddleware } from '../middleware/TokenMiddleware'
import { redis } from '../server'


const route = express.Router()

route.get("/products", TokenMiddleware, async (req: Request, res: Response) => {

    let cacheProducts = await redis.get("products")


    if (cacheProducts) {
        console.log("CacheData")
        res.status(200).send(JSON.parse(cacheProducts))
    } else {
        const products = await AppDataSource.createQueryBuilder().select().from(ProductEntity, 'product').orderBy("product.id", "ASC").execute()

        await redis.set("products", JSON.stringify(products))
        // console.log(products)

        console.log("DbData")
        res.status(200).send(products)
    }
})

export default route