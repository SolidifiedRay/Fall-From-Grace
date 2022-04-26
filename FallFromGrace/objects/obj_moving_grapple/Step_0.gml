/// @description Insert description here
// You can write your code in this editor

if (target != noone) {
	grav_dir = point_direction(x,y,target.x,target.y);
}

hsp += lengthdir_x(grav,grav_dir);
vsp += lengthdir_y(grav,grav_dir);
