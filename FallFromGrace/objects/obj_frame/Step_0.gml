/// @description Insert description here
// You can write your code in this editor

if (container != noone) {
	xport = bbox_left;
	yport = bbox_top;
	hport = container.bbox_bottom - container.bbox_top;
	wport = container.bbox_right - container.bbox_left;
	target = obj_player;
	targetx = target.x;
	targety = target.y;
	if (instance_number(obj_death) > 0) {
		targetx = obj_player.spawnx;
		targety = obj_player.spawny;
	}
	
	if (hport * 16 / 9 < wport) {
		yport = container.bbox_top;
		wport = hport * 16 / 9;
		xport = targetx - wport / 2;
	} else {
		xport = container.bbox_left;
		hport = wport * 9 / 16;
		yport = targety - hport / 2;
	}
	
	
	if (!container.loosefill) {
		x = clamp(targetx, container.bbox_left + hborder, container.bbox_right-hborder);
		y = clamp(targety, container.bbox_top + vborder, container.bbox_bottom-vborder);
		xport = clamp(xport, container.bbox_left, container.bbox_right - wport);
		yport = clamp(yport, container.bbox_top, container.bbox_bottom - hport);
	} else {
		x = clamp(targetx, container.bbox_left, container.bbox_right);
		y = clamp(targety, container.bbox_top, container.bbox_bottom);
		if (bbox_left < container.bbox_left) {
			xport = bbox_left;
		}
		if (bbox_right > container.bbox_right) {
			xport = bbox_right - wport;
		}
		if (bbox_top < container.bbox_top) {
			yport = bbox_top;
		}
		if (bbox_bottom > container.bbox_bottom) {
			yport = bbox_bottom - hport;
		}
	}
}
