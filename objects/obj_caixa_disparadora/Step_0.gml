contador++;
if (contador >= frequencia_disparo) {
    var proj = instance_create_layer(x, y, layer, obj_projetil);
    proj.direcao = 0; 
    contador = 0; 
}