import { AfterViewInit, Component, ViewChild, OnInit, Input, OnChanges, SimpleChanges } from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';
import { Usuario } from '../../../modelos/usuario';

@Component({
  selector: 'app-tabla-usuario',
  templateUrl: './tabla-usuario.component.html',
  styleUrls: ['./tabla-usuario.component.css']
})
export class TablaUsuarioComponent implements OnInit, AfterViewInit, OnChanges {

  @Input() pUsuarios: Usuario[] = [];

  columnas: string[] = ['nombreusuario', 'activo', 'nombrereal','tipousuarioid'];

  datos!: MatTableDataSource<Usuario>;

  @ViewChild(MatPaginator) paginador!: MatPaginator;
  @ViewChild(MatSort) ordenador!: MatSort;

  constructor() { 

    this.datos = new MatTableDataSource(this.pUsuarios);

  }
  ngOnChanges(changes: SimpleChanges): void {

    this.datos = new MatTableDataSource(this.pUsuarios);

    this.datos.paginator = this.paginador;
    this.datos.sort = this.ordenador;
  }

  ngAfterViewInit() {
    this.datos.paginator = this.paginador;
    this.datos.sort = this.ordenador;
  }

  ngOnInit(): void {
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.datos.filter = filterValue.trim().toLowerCase();

    if (this.datos.paginator) {
      this.datos.paginator.firstPage();
    }
  }

}
