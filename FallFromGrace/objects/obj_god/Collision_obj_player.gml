/// @description Insert description here
// You can write your code in this editor

image_alpha -= 0.005;


xrand = random_range(bbox_left,bbox_right);
yrand = random_range(bbox_bottom,bbox_top);

switch irandom(1) {
	case 0:
		star = instance_create_layer(xrand,yrand,"instances",obj_star);
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


star.direction = point_direction(star.x, star.y, obj_player.x, obj_player.y);
star.speed = random(8);
star.image_xscale = random_range(1, 3);
star.image_yscale = star.image_xscale;
