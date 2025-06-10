if (instance_place(x + velh, y, other) && other.sprite_index == spr_porta_fechada) {
    x = xprevious;
    y = yprevious;
    velh=0
}