import express, { Request, Response } from 'express'
import { AppDataSource } from '../AppDataSource'
import { TokenMiddleware } from '../middleware/TokenMiddleware'
import { OrderEntity } from '../entities/orders.entity'
import { UserEntity } from '../entities/user.entity'
import { ProductEntity } from '../entities/products.entity'
import multer from 'multer'
import fs from 'fs'
import path from 'path'

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './uploads')
    },

    filename: (req, file, cb) => {
        const named = new Date().getTime() + '-' + file.fieldname + '.webp'
        cb(null, named)
    }
})

const upload = multer({ storage: storage })

const route = express.Router()

interface TokenInterface extends Request {
    id?: number
}


route.get("/orders", TokenMiddleware, async (req: TokenInterface, res: Response) => {

    const user_id = req.id

    const orders = await AppDataSource.createQueryBuilder().select([
        'o.id AS id',
        'o.timestamp AS timestamp',
        'o.status AS status',
        'o.slip AS slip',
        'u.username AS username',
        'p.name AS product_name',
        'p.price AS product_price'
    ]).from(OrderEntity, 'o')
        .innerJoin(UserEntity, 'u', 'u.id = o.user_id')
        .innerJoin(ProductEntity, 'p', 'p.id = o.product_id')
        .where({ user_id: user_id }).execute()

    // console.log(orders)

    res.status(200).send(orders)
})

route.get("/all_orders", TokenMiddleware, async (req: TokenInterface, res: Response) => {

    const user_id = req.id

    const orders = await AppDataSource.createQueryBuilder().select([
        'o.id AS id',
        'o.timestamp AS timestamp',
        'o.status AS status',
        'o.slip AS slip',
        'u.username AS username',
        'p.name AS product_name',
        'p.price AS product_price'
    ]).from(OrderEntity, 'o')
        .innerJoin(UserEntity, 'u', 'u.id = o.user_id')
        .innerJoin(ProductEntity, 'p', 'p.id = o.product_id')
        .where({ status: 0 }).execute()

    // console.log(orders)

    res.status(200).send(orders)
})

route.post("/purchase", TokenMiddleware, upload.single('slip'), async (req: TokenInterface, res: Response) => {

    const user_id = req.id
    const { product_id } = req.body
    const slip = req.file

    console.log(product_id)
    console.log(slip)
    let timestamp = new Date().getTime()

    const product: ProductEntity[] = await AppDataSource.createQueryBuilder().select().from(ProductEntity, 'product').where({ id: product_id }).execute()

    if (product && product.length > 0) {
        const user: UserEntity[] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where({ id: user_id }).execute()

        let total_amount = user[0].total_days + product[0].days

        // console.log(total_amount)

        const inserted = await AppDataSource.createQueryBuilder().insert().into(OrderEntity).values({ user_id: user_id, product_id: product_id, timestamp: String(timestamp), slip: slip?.filename }).execute()
        // const update_user = await AppDataSource.createQueryBuilder().update(UserEntity).set({ total_days: total_amount }).where({id: user_id}).execute()

        // console.log(update_user)

        if (inserted.raw) {
            res.status(200).send({ purchased: true })
        } else {
            res.status(400).send("Invalid request payload")
        }
    } else {
        res.status(400).send("Product Not found")
    }
})

route.patch("/confirm_slip", TokenMiddleware, async (req: Request, res: Response) => {
    let { order_id, user_id, product_id } = req.body

    // console.log(order_id, user_id, product_id)

    const order: OrderEntity[] = await AppDataSource.createQueryBuilder().select(['user_id', 'product_id']).from(OrderEntity, 'order').where({ id: order_id }).execute()

    console.log(order)
    if (order && order.length > 0) {
        const user: UserEntity[] = await AppDataSource.createQueryBuilder().select().from(UserEntity, 'user').where({ id: order[0].user_id }).execute()
        const product: ProductEntity[] = await AppDataSource.createQueryBuilder().select().from(ProductEntity, 'product').where({ id: order[0].product_id }).execute()

        if (user && user.length > 0 && product && product.length > 0) {

            let result_days = user[0].total_days + product[0].days

            // console.log("UPdate : ", update_order)

            const update_order = await AppDataSource.createQueryBuilder().update(OrderEntity).set({ status: 1 }).where({ id: order_id }).execute()
            const update_user = await AppDataSource.createQueryBuilder().update(UserEntity).set({ total_days: result_days }).where({ id: order[0].user_id }).execute()

            res.status(200).send("Confirmed Slip")

        } else {
            res.status(400).send("Invalid Request")
        }
    }
})

route.patch("/cancel_slip", TokenMiddleware, async (req: Request, res: Response) => {
    let { order_id } = req.body

    const update_order = await AppDataSource.createQueryBuilder().update(OrderEntity).set({ status: 2 }).where({ id: order_id }).execute()

    res.status(200).send("Canceled Slip")

})

route.get("/delete_all_slip", async (req: Request, res: Response) => {
    const files = fs.readdirSync('./uploads')

    console.log("ALL FIELS : ", files.length)

    files.map((item) => {
        // console.log(item)
        const filepath = path.join('./uploads', item)

        if (fs.lstatSync(filepath).isFile()) {
            fs.unlinkSync(filepath)
        }
    })

    // console.log(length)

    res.status(200).send("All Files has been deleted!")
})

export default route