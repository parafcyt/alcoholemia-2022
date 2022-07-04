import { NgModule } from '@angular/core';

import { MatSliderModule } from '@angular/material/slider';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatButtonModule} from '@angular/material/button';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule  } from "@angular/material/paginator";
import {MatFormFieldModule} from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';

/**
 * Clase responsable de importar los componentes de Angular Material
 */
@NgModule({
    imports: [
        MatSliderModule,
        MatToolbarModule,
        MatButtonModule,
        MatTableModule,
        MatPaginatorModule,
        MatFormFieldModule,
        MatInputModule
    ],
    exports: [
        MatSliderModule,
        MatToolbarModule,
        MatButtonModule,
        MatTableModule,
        MatPaginatorModule,
        MatFormFieldModule,
        MatInputModule
    ]
})
export class MaterialModule { }