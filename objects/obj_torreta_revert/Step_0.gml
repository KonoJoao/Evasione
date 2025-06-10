// Dentro do Step da obj_torreta
fire_timer += 1;

if (fire_timer >= fire_rate) {
    fire_timer = 0;

    var offset_x = -16; // Negativo para spawn à esquerda
    var offset_y = 0; // ou -16 para centralizar se necessário

    var px = x + offset_x;
    var py = y + offset_y - 58;

    var p = instance_create_layer(px, py, layer, obj_projetil);
    p.direction = 180; // 180 graus = esquerda
    p.speed = 6;
}