/// @description Insert description here
// You can write your code in this editor

/*
xrand = random_range(bbox_left,bbox_right);
yrand = random_range(bbox_bottom,bbox_top);
if (point_distance(obj_player.x, obj_player.y, xrand, yrand) < 500) {
	timer += glitterspawn;
	if (timer >= 1) {
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
		timer--;
	}
}
*/

outline._x1 = bbox_left - w;
outline._x2 = bbox_right + w;
outline._y1 = bbox_top - w;
outline._y2 = bbox_bottom + w;

