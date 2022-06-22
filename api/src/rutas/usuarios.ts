import { Router } from "express";   

import { GetUsuarios, DeleteUsuario, UpdateUsuario } from "../controladores/usuario";

const router : Router= Router();

router.get('/usuario/todos', GetUsuarios);
router.delete('/usuario/:nombreUsuario', DeleteUsuario);
router.put('/usuario', UpdateUsuario);


export default router;