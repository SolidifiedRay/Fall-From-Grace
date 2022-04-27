/// @description Insert description here
// You can write your code in this editor

instance_destroy();

wall = instance_create_layer(x+sprite_width/2,y+sprite_height/2,"collision",obj_moving_grapple);
//wall.hsp = random_range(-3,3);
//wall.vsp = random_range(-3,3);
//wall.vsp = -3;
wall.alarm[0] = 999;
