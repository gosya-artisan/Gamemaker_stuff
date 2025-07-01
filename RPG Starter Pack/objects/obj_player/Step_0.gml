// Переменные для направления движения
var move_x = 0;
var move_y = 0;

// Проверяем нажатие клавиш

if (keyboard_check(vk_right) || keyboard_check(ord("D")))
{
    move_x += 1;
	sprite_index = spr_player_walk_right;
}
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    move_x -= 1;
	sprite_index = spr_player_walk_left;
}
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    move_y += 1;
	sprite_index = spr_player_walk_down;
}
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    move_y -= 1;
	sprite_index = spr_player_walk_up;
}

// Нормализуем движение, чтобы скорость по диагонали не была выше
if (move_x != 0 || move_y != 0) {
    var length = point_distance(0, 0, move_x, move_y);
    move_x /= length;
    move_y /= length;
}

// Перемещаем персонажа и столкновения со стенами
if (!place_meeting(x+move_x * move_speed, y, obj_wall) && !place_meeting(x, y +  move_y * move_speed, obj_box))
{
	x += move_x * move_speed;
}
if (!place_meeting(x, y +  move_y * move_speed, obj_wall) && !place_meeting(x, y +  move_y * move_speed, obj_box) )
{
	y += move_y * move_speed;
}


x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);



//idle animations

if (sprite_index == spr_player_walk_right)
{
	sprite_index = spr_player_idle_right
}
if (sprite_index == spr_player_walk_left)
{
	sprite_index = spr_player_idle_left
}
if (sprite_index == spr_player_walk_down)
{
	sprite_index = spr_player_idle_down
}
if (sprite_index == spr_player_walk_up)
{
	sprite_index = spr_player_idle_up
}


//attack
if (keyboard_check(vk_space) && melee_attack_cooldown == false && !instance_exists(obj_slash))
{
	melee_attack_cooldown = true
	alarm[0] = melee_attack_cooldown_time;
	instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_slash);
	if(sprite_index ==spr_player_walk_left || sprite_index == spr_player_idle_left)
	{
		obj_slash.image_angle = 180;
	}
	else if(sprite_index ==spr_player_walk_down || sprite_index == spr_player_idle_down)
	{
		obj_slash.image_angle = 270;
	} 
	else if(sprite_index ==spr_player_walk_up || sprite_index == spr_player_idle_up)
	{
		obj_slash.image_angle = 90;
	}
}

//death
var enemy = instance_place(x, y, obj_enemy);
if (enemy != noone) {
    if (!enemy.dead) {
        instance_destroy(obj_shadow);
		instance_destroy(obj_slash);
		instance_destroy(obj_player);
		game_controller.game_over = true;
    }
}


