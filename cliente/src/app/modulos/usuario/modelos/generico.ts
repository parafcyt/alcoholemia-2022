export interface Generico1 {
    variable: number;
}

export interface Generico2<T> {
    variable: T;
}

let a: Generico1 = { variable: 1};
let b: Generico2<Generico1> = { variable: a};