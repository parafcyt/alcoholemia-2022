import { Pool } from "pg";
import { conexionBbdd } from "../configuracion/database";

//hago el cliente de bbdd

export function bbddCliente() :Pool {
    const pool=new Pool(conexionBbdd);

    pool.on('connect',()=>{
        console.log('Conectado a postgres');
    });

    pool.on('error',(err)=>{
        console.log(err);
        process.exit(0);
    });

    return pool;
}