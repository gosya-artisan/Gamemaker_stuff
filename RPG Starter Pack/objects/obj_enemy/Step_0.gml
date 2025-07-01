if (!game_controller.game_over){
	if (instance_exists(obj_player)){
		move_towards_point(obj_player.x, obj_player.y, move_speed && !self.atacking);
} else{
	move_speed = 0;
}

if(point_distance(x,y,obj_player.x, obj_player.y) < 20 && !self.dead && !self.atacking)
{
	//atack();
}

	if (place_meeting(x,y,obj_slash) && obj_slash.enemys_killed <= obj_slash.enemy_penetration
	&& !invulnerable)
	{
		dead = true;
		obj_slash.enemys_killed++;
		obj_player.player_score+=1;
		sprite_index = spr_enemy1_death;
		alarm[0] = 5;
	}
}