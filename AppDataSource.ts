import { DataSource } from "typeorm";

export const AppDataSource = new DataSource({
    type: 'postgres',
    host: 'db',
    database: 'outwittrader',
    port: 5432,
    username: 'postgres',
    password: '123456',
    synchronize: false,
    entities: ['./entities/*.entity.ts']
})

AppDataSource.initialize().then(() => {
    console.log("AppDataSource Initialized!")
})