if(instance_exists(obj_player)){
	// Центрировать камеру на игроке
var target_x = obj_player.x - camera_get_view_width(global.cam) / 2;
var target_y = obj_player.y - camera_get_view_height(global.cam) / 2;

// Ограничить камеру пределами комнаты
target_x = clamp(target_x, 0, room_width - camera_get_view_width(global.cam));
target_y = clamp(target_y, 0, room_height - camera_get_view_height(global.cam));

camera_set_view_pos(global.cam, target_x, target_y);
}
