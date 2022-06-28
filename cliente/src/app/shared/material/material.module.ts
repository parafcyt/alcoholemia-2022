import { NgModule } from '@angular/core';

import { MatSliderModule } from '@angular/material/slider';

/**
 * Clase responsable de importar los componentes de Angular Material
 */
@NgModule({
    imports: [
        MatSliderModule
    ],
    exports: [
        MatSliderModule
    ]
})
export class MaterialModule { }