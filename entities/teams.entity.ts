import { Column, Entity, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";

@Entity({ name: 'teams' })
export class TeamsEntity {
    @PrimaryGeneratedColumn({ name: 'id' })
    id: number

    @Column({ name: 'owner_id' })
    owner_id: number

    @Column({ name: 'team_name' })
    team_name: string

    @Column({ name: 'status' })
    status: number

    @Column({ name: 'broker_link' })
    broker_link: string
    
    @Column({name: 'members'})
    members: number

    @Column({name: 'total_money'})
    total_money: number

    @Column({name: 'broker_money'})
    broker_money: number
}