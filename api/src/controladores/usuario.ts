import { Request, Response } from "express";
import { Pool, QueryResult } from "pg";

import { bbddCliente } from "../bbdd/bbddCliente";

export async function GetUsuarios(req: Request, res: Response){
    try {

        const clienteBbdd: Pool = bbddCliente();

        const respuesta: QueryResult = await clienteBbdd.query('select * from usuario;');
        
        res.status(200).send(respuesta.rows);
    } 
    
    catch (error) {
        res.status(500).send(error);
    }
}

export async function DeleteUsuario(req: Request, res: Response){
    try {

        const clienteBbdd: Pool= bbddCliente();

        const consulta: string = 'select * from bajaUsuario($1);';
        const nombreUsuarioParam: string[] = [req.params.nombreUsuario];

        const respuesta: QueryResult = await clienteBbdd.query(consulta, nombreUsuarioParam);
        
        res.status(200).send(respuesta.rows);
    } 
    
    catch (error) {
        res.status(500).send(error);
    }
}

export async function UpdateUsuario(req: Request, res: Response){
    try {

        const clienteBbdd: Pool= bbddCliente();

        const consulta: string = 'select * from ModificarUsuario($1,$2,$3,$4);';
        const usuarioParam: string[] = [
            req.body.nombreUsuario,
            req.body.contrasenia,
            req.body.nombreReal,
            req.body.tipoUsuarioId
        ];

        const respuesta: QueryResult = await clienteBbdd.query(consulta, usuarioParam);
        
        res.status(200).send(respuesta.rows);
    } 
    
    catch (error) {
        res.status(500).send(error);
    }
}

export async function AddUsuario(req:Request,res:Response){
    try {
        const clienteBbdd: Pool= bbddCliente();
        const consulta :string='select * from altaUsuario($1,$2,$3,$4)';
        const usuarioParam:string[]=[
            req.body.nombreUsuario,
            req.body.contrasenia,
            req.body.nombreReal,
            req.body.tipoUsuarioId
        ];

        const respuesta:QueryResult=await clienteBbdd.query(consulta,usuarioParam);
        res.status(200).send(respuesta.rows);
    }
    catch (error){
        res.status(500).send(error);
    }

}