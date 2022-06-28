import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UsuarioRoutingModule } from './usuario-routing.module';
import { UsuarioComponent } from './usuario.component';
import { UsuarioListaComponent } from './paginas/usuario-lista/usuario-lista.component';


@NgModule({
  declarations: [
    UsuarioComponent,
    UsuarioListaComponent
  ],
  imports: [
    CommonModule,
    UsuarioRoutingModule
  ]
})
export class UsuarioModule { }
