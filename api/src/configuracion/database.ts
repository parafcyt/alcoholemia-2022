import { ClientConfig } from "pg";

//datos para conectarme a postgres
export const conexionBbdd : ClientConfig ={
    host: 'localhost',
    database: 'alcoholemia',
    password:'alexis',
    port: 5432,
    user: 'postgres'
}