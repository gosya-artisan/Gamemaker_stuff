if (!obj_server.game_over && instance_exists(obj_player)){
	
	if (attacking) {
	        speed = speed;
	        direction = direction;
	    } else if (!dead) {
	         move_towards_point(obj_player.x, obj_player.y, move_speed);
	    } else {
	        speed = 0;
	    }
    
	    var dist = point_distance(x, y, obj_player.x, obj_player.y);
	    if (dist < self.attack_range_max && dist > self.attack_range_min && !self.dead && self.attack_ready) {
	        attack();
	    }

	if (place_meeting(x,y,obj_slash) && obj_slash.enemys_killed <= obj_slash.enemy_penetration
	&& !invulnerable)	{
		dead = true;
		obj_slash.enemys_killed++;
		obj_player.player_score+=1;
		sprite_index = spr_enemy1_death;
		alarm[0] = 5;
	}
}