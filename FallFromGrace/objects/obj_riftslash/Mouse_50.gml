/// @description Insert description here
// You can write your code in this editor

hsp = lerp(hsp,mouse_x-x,0.9);
vsp = lerp(vsp,mouse_y-y,0.9);

	
newrift = instance_create_layer(x,y,"collision",obj_futurerift);
newrift.alarm[0] = 20;

