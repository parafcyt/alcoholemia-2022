import { ClientConfig } from "pg";

//datos para conectarme a postgres
export const clienteConfig : ClientConfig ={
    host: 'localhost',
    database: 'alcoholemia',
    password:'alexis',
    port: 5432,
    user: 'postgres'
}