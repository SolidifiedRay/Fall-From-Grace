/// @description Insert description here
// You can write your code in this editor

if (!collision_circle(x,y,8,obj_wall,0,0) && !collision_circle(x,y,8,obj_moving_grapple,0,0)) {
	instance_destroy();
}
