var w = 320; // ширина камеры
var h = 180; // высота камеры
global.cam = camera_create_view(0, 0, w, h, 0, obj_player, -1, -1, -1, -1);
view_camera[0] = global.cam;