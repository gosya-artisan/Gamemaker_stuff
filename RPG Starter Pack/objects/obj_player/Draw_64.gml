draw_set_color(c_yellow);
draw_set_font(fnt_main);

draw_text(self.x,self.y, "Players:  " + string(ds_list_size(obj_server.sockets)));