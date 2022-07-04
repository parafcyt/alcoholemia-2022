import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MaterialModule } from "../../shared/material/material.module";
import { ReactiveFormsModule } from '@angular/forms';

import { UsuarioRoutingModule } from './usuario-routing.module';
import { UsuarioComponent } from './usuario.component';
import { UsuarioListaComponent } from './paginas/usuario-lista/usuario-lista.component';
import { TablaUsuarioComponent } from './componentes/usuario/tabla-usuario/tabla-usuario.component';


@NgModule({
  declarations: [
    UsuarioComponent,
    UsuarioListaComponent,
    TablaUsuarioComponent
  ],
  imports: [
    CommonModule,
    UsuarioRoutingModule,
    MaterialModule,
    ReactiveFormsModule
  ]
})
export class UsuarioModule { }
