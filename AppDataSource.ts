import { DataSource } from "typeorm";
import { state } from "./config";

export const AppDataSource = new DataSource({
    type: 'postgres',
    // host: state == 'dev' ? 'localhost' : 'db',
    host: state == 'dev' ? 'localhost' : 'localhost',
    database: 'outwittrader',
    // port: 5432,
    port: 5433,
    // username: state == 'dev' ? 'postgres' : 'play2',
    username: state == 'dev' ? 'postgres' : 'postgres',
    password: '123456',
    synchronize: false,
    entities: ['./entities/*.entity.ts']
})

AppDataSource.initialize().then(() => {
    console.log("AppDataSource Initialized!")
})