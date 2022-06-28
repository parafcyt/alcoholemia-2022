import { NgModule } from '@angular/core';

import { MatSliderModule } from '@angular/material/slider';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatButtonModule} from '@angular/material/button';

/**
 * Clase responsable de importar los componentes de Angular Material
 */
@NgModule({
    imports: [
        MatSliderModule,
        MatToolbarModule,
        MatButtonModule
    ],
    exports: [
        MatSliderModule,
        MatToolbarModule,
        MatButtonModule
    ]
})
export class MaterialModule { }