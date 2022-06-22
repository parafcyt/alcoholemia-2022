import { Request,Response } from "express";

export function pruebaControlador(req: Request, res:Response) {

    res.status(200).send('Hola Mona desde controlador');
}