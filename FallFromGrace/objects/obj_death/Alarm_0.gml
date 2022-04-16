/// @description Insert description here
// You can write your code in this editor

obj_player.dead = false;
obj_player.x = obj_player.spawnx;
obj_player.y = obj_player.spawny;
obj_player.hsp = 0;
obj_player.vsp = 0;
instance_destroy();
instance_create_layer(obj_player.x,obj_player.y,"instances",obj_spawnanim);
