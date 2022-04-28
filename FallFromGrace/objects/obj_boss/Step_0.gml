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
	
	switch(pattern){
		case 0:
		break;
		
		case 1: //horizontal left to right 
			newrs = instance_create_layer(x-50,y+300, "Collision", obj_riftslash)
			newrs.speed =50;
			newrs.hsp = 10;
			newrs.vsp = 0;
			newrs.alarm[0]=10;
			pattern =0;
		break;
	}
	clock++;
}
else{
}
