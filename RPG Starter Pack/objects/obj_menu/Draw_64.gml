draw_set_font(fnt_main);

draw_set_halign(fa_center);

for (var i = 0; i < array_length(menu); i++){
	draw_set_color(cur_index == i  ? c_green : c_white);
	draw_text(room_width/2,  100+32*i, menu[i] );
}
draw_set_halign( fa_left);