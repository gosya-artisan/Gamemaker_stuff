var event_id = async_load[? "id"];
if server == event_id{
	var type = async_load[? "type"];
	var sock = async_load[? "socket"];
	// connect
	if(type == network_type_connect){
		//create player obj, add socket to list
		var p = instance_create_layer(room_width/2+sock, room_height/2, "Instances", obj_player);
		ds_list_add(sockets, sock);
		ds_map_add(clients, sock, p);
		
		
}
	//disconnect
	if(type == network_type_disconnect){
		//remove player obj 
		var p = clients[? sock];
		if (instance_exists(p)){
			with(p){
				instance_destroy();instance_destroy();
			}
		}
		 ds_list_delete(sockets, ds_list_find_index(sockets,sock));
		 ds_map_delete(clients, sock);
	}
}