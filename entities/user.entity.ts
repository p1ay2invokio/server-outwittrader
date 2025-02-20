import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ name: 'user' })
export class UserEntity {
    @PrimaryGeneratedColumn({ name: 'id' })
    id: number

    @Column({ name: 'username' })
    username: string

    @Column({ name: 'password' })
    password: string

    @Column({ name: 'email' })
    email: string

    @Column({ name: 'phone_number' })
    phone_number: string

    @Column({ name: 'role', default: 0 })
    role: number

    @Column({ name: 'total_days', default: 0 })
    total_days: number
}