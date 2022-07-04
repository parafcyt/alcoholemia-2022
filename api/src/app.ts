import express, { Application } from "express";

import morgan from "morgan";
import cors from "cors";
//import { bbddCliente } from "./bbdd/bbddCliente";
//import { Pool } from "pg";

import usuarioRutas from "./rutas/usuarios";



const app: Application = express();

app.set("puerto",3000);

//middlewares
app.use(morgan("dev"));
app.use(express.json());
app.use(cors({origin:'http://localhost:4200',credentials:true}));

//solo/api
app.get('/api',(req,res)=>{
    res.send('Hola Mona');
});

//es /api/prueba
app.use('/api',usuarioRutas);


//pruebo conexion a postgres
// const cliente :Pool= bbddCliente();

// cliente.query('select * from usuario;').then(respuesta=>{
//     console.log(respuesta.rows);
    
// });


export default app;

