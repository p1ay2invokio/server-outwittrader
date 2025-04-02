import { Column, Entity, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";

@Entity({name: 'teams'})
export class TeamsEntity{
    @PrimaryGeneratedColumn({name: 'id'})
    id: number

    @Column({name: 'owner_id'})
    owner_id: number

    @Column({name: 'team_name'})
    team_name: string

    @Column({name: 'status'})
    status: number
}