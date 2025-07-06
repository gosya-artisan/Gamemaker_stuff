//initialize server
#macro PORT 4000
#macro MAX_CLIENTS 2

server = network_create_server(network_socket_tcp,PORT, MAX_CLIENTS);
clients = ds_map_create()
sockets = ds_list_create()

randomise();
game_over = false;
spawn_cooldown_rate = 90;
spawn_cooldown = false;

x_pos = 0;
y_pos = 0;

side_chooser = 1;

var p_host = instance_create_layer(room_width/2, room_height/2, "Instances", obj_player);

//game parameters

function spawnEnemies()
{
	if (!spawn_cooldown && !game_over)
{
	side_chooser = irandom(4)
	if (side_chooser == 0)//right
	{
		x_pos = room_width + 50;
		y_pos =irandom (room_height + 50);
	}

	if (side_chooser == 1)//left
	{
		x_pos = -50;
		y_pos = irandom (room_height + 50);
	}

	if (side_chooser == 2)//up
	{
		x_pos = irandom(room_width + 50);
		y_pos = room_height + 50
	}

	if (side_chooser == 3)//right
	{
		x_pos = irandom(room_width + 50);
		y_pos = -50
	}

	instance_create_layer(x_pos, y_pos, "Instances", obj_enemy);
	spawn_cooldown = true;
	alarm[0] = spawn_cooldown_rate;
}

}
