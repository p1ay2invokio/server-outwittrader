import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ name: 'orders' })
export class OrderEntity {
    @PrimaryGeneratedColumn({ name: 'id' })
    id: number

    @Column({ name: 'user_id' })
    user_id: number

    @Column({ name: 'product_id' })
    product_id: number

    @Column({ name: 'timestamp' })
    timestamp: string

    @Column({ name: 'slip' })
    slip: string

    @Column({ name: 'status' })
    status: number
}