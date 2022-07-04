import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from 'rxjs';
import { Usuario } from '../modelos/usuario';

const cGET_USUARIOS_URL: string = "http://localhost:3000/api/usuario/todos";
const cDELETE_USUARIO_URL: string = 'http://localhost:3000/api/usuario/';
const cUPDATE_USUARIO_URL: string = 'http://localhost:3000/api/usuario';
const cADD_USUARIO_URL: string = 'http://localhost:3000/api/usuario/nuevo';


@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private httpCliente: HttpClient) { }

  getUsuarios(): Observable<Usuario[]> {

    return this.httpCliente.get<Usuario[]>(cGET_USUARIOS_URL);
  }

  deleteUsuario(id: string): Observable<Usuario>{
    return this.httpCliente.delete<Usuario>(cDELETE_USUARIO_URL+id);
  }

  updateUsuario(usuario: Usuario): Observable<Usuario>{
    return this.httpCliente.put<Usuario>(cUPDATE_USUARIO_URL,usuario);
  }

  addUsuario(usuario: Usuario): Observable<Usuario>{
    return this.httpCliente.post<Usuario>(cADD_USUARIO_URL,usuario);
  }


}
