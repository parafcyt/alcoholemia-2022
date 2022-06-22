import app from "./app";

const puerto = app.get('puerto');

app.listen(puerto,()=>{
    console.log(`Escuchando en el puerto ${puerto}`);   
});