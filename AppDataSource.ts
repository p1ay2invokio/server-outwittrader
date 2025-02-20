import { DataSource } from "typeorm";

export const AppDataSource = new DataSource({
    type: 'mssql',
    host: 'localhost',
    database: 'outwittrader',
    port: 50766,
    username: 'sa',
    password: 'yourStrong(!)Password',
    synchronize: false,
    entities: ['./entities/*.entity.ts'],
    options:{
        trustServerCertificate: true
    }

})

AppDataSource.initialize().then(() => {
    console.log("AppDataSource Initialized!")
})