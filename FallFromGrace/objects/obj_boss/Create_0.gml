/// @description Insert description here
// You can write your code in this editor
dead = false;
clock = 0;
pattern = 0;

checkpointcount = -1;

starradius = 32;
cooldown = 0;

deadangle = 1080+360;

visible = true;

newrift = instance_create_layer(x-64,y-64,"rifts",obj_rift_that_disappears);
newrift.image_xscale = 2;
newrift.image_yscale = 2;

grapple = instance_create_layer(x,y,"collision",obj_moving_grapple);

angletotal = 0;
lastangle = 0;


checkpoint0 = instance_create_layer(x,y,"instances",obj_racecheckpoint);
checkpoint0.image_angle = 270;
checkpoint0.checknum = 0;
checkpoint0.image_yscale = 20;
checkpoint0.image_xscale = 0.2;
checkpoint0.visible = false;

offset = 0;

madegod = false;
