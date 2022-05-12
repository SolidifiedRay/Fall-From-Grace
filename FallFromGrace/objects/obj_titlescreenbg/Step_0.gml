


repeat(12){
	xrand = random_range(0,room_width);
	yrand = random_range(0,room_height);
	switch irandom(1) {
		case 0:
			star = instance_create_depth(xrand,yrand,depth+1,obj_star);
			switch irandom(2) {
				case 0: star.image_blend = c_aqua;
				break;
				case 1: star.image_blend = c_yellow;
				break;
				default: star.image_blend = c_white;
				break;
			}
			break;
		case 1:
			star = instance_create_layer(xrand,yrand,"instances",obj_blob);
			break;
	}
	star.image_xscale = random_range(0.5,2);
	star.image_yscale = star.image_xscale;
	star.vspeed -= random(1);
}
