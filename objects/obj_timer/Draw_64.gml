draw_set_font(ft_timer)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

if(minutos > 1)
	draw_set_colour(c_white)
else
	draw_set_colour(c_red)
	
var tempo = ""
tempo += string(minutos)
tempo += ":"

if segundos > 9 {tempo += "" + string(segundos)}
if segundos < 10 {tempo += "0" + string(segundos)}

tempo += "." + string(milisegundos)

draw_text(5, 5, tempo)