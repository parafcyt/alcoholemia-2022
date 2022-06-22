import { Router } from "express";   

import { pruebaControlador } from "../controladores/prueba";

const router : Router= Router();

router.get('/prueba',pruebaControlador);


export default router;