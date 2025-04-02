import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ name: 'users' })
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

    @Column({ name: 'name' })
    name: string

    @Column({ name: 'surname' })
    surname: string

    @Column({ name: 'thai_id' })
    thai_id: string

    @Column({ name: 'age' })
    age: number

    @Column({ name: 'gender' })
    gender: string

    @Column({ name: 'bod' })
    bod: string

    @Column({ name: 'job' })
    job: string

    @Column({ name: 'salary' })
    salary: number

    @Column({ name: 'bank_account' })
    bank_account: string

    @Column({ name: 'bank_name' })
    bank_name: string

    @Column({ name: 'face_img' })
    face_img: string

    @Column({ name: 'bank_img' })
    bank_img: string

    @Column({ name: 'thai_id_img' })
    thai_id_img: string
}