import { DataSource } from "typeorm";
import { state } from "./config";

export const AppDataSource = new DataSource({
    type: 'postgres',
    host: state == 'dev' ? 'localhost' : 'outwit_db',
    // host: state == 'dev' ? 'localhost' : 'localhost',
    database: 'outwittrader',
    port: 5432,
    username: state == 'dev' ? 'postgres' : 'play2',
    password: '21947',
    synchronize: false,
    entities: ['./entities/*.entity.ts']
})

AppDataSource.initialize().then(() => {
    console.log("AppDataSource Initialized!")
})