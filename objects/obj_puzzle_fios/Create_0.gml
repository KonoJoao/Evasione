// Cria os 4 fios
fios[0] = instance_create_depth(100, 200, 0, obj_fio);
fios[1] = instance_create_depth(100, 250, 0, obj_fio);
fios[2] = instance_create_depth(100, 300, 0, obj_fio);
fios[3] = instance_create_depth(100, 350, 0, obj_fio);

// Define qual é o fio correto (aleatório ou fixo)
fios[irandom(3)].corretor = true;

// Configurações visuais
for (var i = 0; i < 4; i++) {
    fios[i].x1 = 100;
    fios[i].x2 = 300;
    fios[i].y1 = 200 + i * 50;
    fios[i].y2 = 200 + i * 50;
    fios[i].cor_normal = make_color_rgb(irandom(255), irandom(255), irandom(255));
}