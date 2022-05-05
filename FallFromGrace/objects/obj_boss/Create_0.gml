/// @description Insert description here
// You can write your code in this editor
dead = false;
clock = 0;
pattern = 0;

checkpointcount = -1;

checkpoint0 = noone;
starradius = 32;
cooldown = 0;

rotations = 3;
checkpointcount = 90;
angle = rotations * 360 / checkpointcount;

checkpointcount = 120;
offset = 0;
visible = true;

newrift = instance_create_layer(x-64,y-64,"rifts",obj_rift_that_disappears);
newrift.image_xscale = 2;
newrift.image_yscale = 2;

grapple = instance_create_layer(x,y,"collision",obj_moving_grapple);
