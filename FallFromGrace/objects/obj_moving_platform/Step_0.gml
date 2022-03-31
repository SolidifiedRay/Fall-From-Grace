/// @description Insert description here
// You can write your code in this editor
mask_index = sprite_moving_platform;

hsp = dir * movespeed;


if x > 600 and x < 650 {
	dir = 1;
}

if x > 1200 and x < 1250 {
	dir = -1;
}

x += hsp;
