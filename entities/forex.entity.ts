import { Column, Entity, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";

@Entity({ name: 'forex' })
export class ForexEntity {
    @PrimaryGeneratedColumn({ name: 'id' })
    id: number


    @Column({ name: 'news' })
    news: string
}