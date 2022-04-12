/// @description Insert description here
// You can write your code in this editor

if (container != noone) {
	xport = bbox_left;
	yport = bbox_top;
	hport = container.sprite_height;
	wport = container.sprite_width;
	
	if (hport * 16 / 9 < wport) {
		hport = container.sprite_height;
		yport = container.bbox_top;
		wport = hport * 16 / 9;
		xport = obj_player.x - wport / 2;
	} else {
		wport = container.sprite_width;
		xport = container.bbox_left;
		hport = wport * 9 / 16;
		yport = obj_player.y - hport / 2;
	}
	
	x = clamp(obj_player.x, container.bbox_left, container.bbox_right);
	y = clamp(obj_player.y, container.bbox_top, container.bbox_bottom);
}
