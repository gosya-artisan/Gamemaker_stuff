mode = "chase"; 
dead = false;
invulnerable = false;
move_speed = 1;
atacking = false;

function initialize() {
    if (invulnerable) {
		self.dead = true;
        self.invulnerable = true;
        self.move_speed = 0;
        alarm[1] = 60;
    } 
}

function atack(){
	atacking = true;
	self.move_speed = 0;
	alarm[2] = 30;
}

