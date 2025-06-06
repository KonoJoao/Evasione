// Colisão horizontal
var _col = instance_place(x + velh, y, obj_chao);
if (!_col) _col = instance_place(x + velh, y, obj_plataforma);
if (!_col) _col = instance_place(x + velh, y, obj_plataforma2);

if(_col){
	if(velh > 0){
		x = _col.bbox_left + (x - bbox_right);
	}
	if(velh < 0){
		x = _col.bbox_right + (x - bbox_left);
	}
	velh = 0;
}

x += velh;

// Verificação de segurança - manter player dentro dos limites da room
x = clamp(x, 0, room_width);

// Colisão vertical
var _col = instance_place(x, y + velv, obj_chao);

if (!_col && velv >= 0) {
    var plat = instance_place(x, y + velv, obj_plataforma);
    if (plat && bbox_bottom <= plat.bbox_top + abs(velv)) {
        _col = plat;
    }
}

if (!_col && velv >= 0) {
    var plat2 = instance_place(x, y + velv, obj_plataforma2);
    if (plat2 && bbox_bottom <= plat2.bbox_top + abs(velv)) {
        _col = plat2;
    }
}

if (!_col && velv >= 0) {
    var escada = instance_place(x, y + velv, obj_escada_pedra);
    if (escada && bbox_bottom <= escada.bbox_top + abs(velv)) {
        _col = escada;
    }
}

if(_col){
	if(velv > 0){
		y = _col.bbox_top + (y - bbox_bottom);
	}
	if(velv < 0){
		y = _col.bbox_bottom + (y - bbox_top);
	}
	velv = 0;
}

y += velv;

y = clamp(y, 0, room_height);
