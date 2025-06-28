import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({name: 'products'})
export class ProductEntity{
    @PrimaryGeneratedColumn({name: 'id'})
    id: number

    @Column({name: 'name'})
    name: string

    @Column({name: 'price'})
    price: number

    @Column({name: 'detail'})
    detail: string

    @Column({name: 'days'})
    days: number

    @Column({name: 'type'})
    type: string
}