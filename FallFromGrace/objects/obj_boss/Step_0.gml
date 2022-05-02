/// @description Insert description here
// You can write your code in this editor

if (not dead){
	
	repeat(4) {
		var dir = random(360);
		var dist = random(256);

		star = irandom(1) ? instance_create_layer(x+lengthdir_x(dist,dir),y+lengthdir_y(dist,dir),"instances",obj_star)
		: instance_create_layer(x+lengthdir_x(dist,dir),y+lengthdir_y(dist,dir),"instances",obj_blob);
		//star.image_blend = irandom(c_white);
		star.image_blend = irandom(1) ? c_white : c_black;
		star.gravity = 0.1;
		star.gravity_direction = dir + 180;
		star.image_xscale = random_range(1,3);
		star.image_yscale = star.image_xscale
	}
	
	if (!obj_player.dead && clock > 60) {
		
		switch (clock mod 300) {
			case 0: pattern = 1; break;
			case 60: pattern = 2; break;
			case 120: pattern = 3; break;
			case 180: pattern = 4; break;
			case 240: pattern = 5; break;
		}
		
		//if (clock mod 15 == 0) {
		//	newrs = instance_create_layer(x,y, "Collision", obj_riftslash)
		//	newrs.speed =50;
		//	newrs.direction = 0.7 * -clock;
		//	newrs.alarm[0]=20;
		//}
	}

	
	
	switch(pattern){
		case 0:
		break;
		
		case 1: //horizontal 
			newrs = instance_create_layer(obj_player.x-150,obj_player.y, "Collision", obj_riftslash)
			newrs.speed =50;
			newrs.direction = 0;
			newrs.alarm[0]=10;
			pattern =0;
		break;
		
		case 2://vertical
			newrs = instance_create_layer(obj_player.x, obj_player.y-300, "Collision",obj_riftslash)
			newrs.speed = 50;
			newrs.direction = -90;
			newrs.alarm[0]=10;
			pattern = 0;
		break;
		
		case 3://left up to right down
			newrs = instance_create_layer(obj_player.x-150, obj_player.y-150, "Collision",obj_riftslash)
			newrs.speed = 50;
			newrs.direction = -45;
			newrs.alarm[0]=10;
			pattern = 0;
		break;
		
		case 4://right up to left down
			newrs = instance_create_layer(obj_player.x+150, obj_player.y-150, "Collision",obj_riftslash)
			newrs.speed = 50;
			newrs.direction = -135;
			newrs.alarm[0]=10;
			pattern = 0;
		break;
		
		case 5:
			newrs1 = instance_create_layer(obj_player.x-150, obj_player.y-150, "Collision",obj_riftslash)
			newrs1.speed = 50;
			newrs1.direction = -45;
			newrs1.alarm[0]=10;
			
			
			newrs2 = instance_create_layer(obj_player.x+150, obj_player.y-150, "Collision",obj_riftslash)
			newrs2.speed = 50;
			newrs2.direction = -135;
			newrs2.alarm[0]=10;
			pattern = 0;
		break;
			
		
		
			
		
		
	}
	clock++;
}
else{
}
