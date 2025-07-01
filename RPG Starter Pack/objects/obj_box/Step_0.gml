if (place_meeting(x,y,obj_slash) && obj_slash.enemys_killed <= obj_slash.enemy_penetration)
{
	instance_destroy(self);
	obj_slash.enemys_killed++;
	obj_player.player_score++;
}