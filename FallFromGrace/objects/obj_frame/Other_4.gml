/// @description Insert description here
// You can write your code in this editor

xport = bbox_left;
yport = bbox_top;
hport = sprite_height;
wport = sprite_width;

if (hport * 16 / 9 > wport) {
	wport = hport * 16 / 9;
	xport = x - wport / 2;
} else {
	hport = wport * 9 / 16;
	yport = y - hport / 2;
}

if (container != noone) {
	container.loosefill = true;
}
