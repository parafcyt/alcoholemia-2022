import { Router } from "express";   

import { GetUsuarios, DeleteUsuario, UpdateUsuario, AddUsuario } from "../controladores/usuario";

const router : Router= Router();

router.get('/usuario/todos', GetUsuarios);
router.delete('/usuario/:nombreUsuario', DeleteUsuario);
router.put('/usuario', UpdateUsuario);
router.post('/usuario/nuevo',AddUsuario);


export default router;