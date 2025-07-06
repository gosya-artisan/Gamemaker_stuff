draw_set_color(c_yellow);
draw_set_font(fnt_main);

draw_text(200, 150, "Players:  " + string(ds_list_size(sockets)));
