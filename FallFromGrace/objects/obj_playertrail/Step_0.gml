/// @description Insert description here
// You can write your code in this editor

if (timer > 0) timer -= 1 / 120;
else instance_destroy();
image_yscale = timer;
image_xscale = timer;