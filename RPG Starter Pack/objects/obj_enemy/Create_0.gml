mode = "chase"; 
dead = false;
invulnerable = false;
move_speed = 1;
recovery_duration = 60; //also preparation for attack
dash_duration = 60;
dash_speed = 3;
attack_preparation_duration = 30;
attack_range_min = 20;
attack_range_max = 50;
attack_cooldown = 120;
attacking = false;
attack_ready = true;


function init_default(){
	speed = 0;
	mode = "chase"; 
	dead = false;
	invulnerable = false;
	move_speed = 1;
	recovery_duration = 60;
	dash_duration = 30;
	attack_range = 60;
	attack_cooldown = 120;
	
	attacking = false;
}
function init_frozen() {
		self.invulnerable = true;
		self.dead = true;
        self.move_speed = 0;
        alarm[1] = 60;
}

function attack(){
	if (instance_exists(obj_player) && !self.dead) {
		self.move_speed = 0;		
		self.attack_ready = false;
		alarm[2] = attack_preparation_duration; 
}
}

