/// @description Insert description here
// You can write your code in this editor

if (target != noone) {
	gravity_direction= point_direction(x,y,target.x,target.y);
	if (point_distance(x,y,target.x,target.y) < speed ) instance_destroy();
}


