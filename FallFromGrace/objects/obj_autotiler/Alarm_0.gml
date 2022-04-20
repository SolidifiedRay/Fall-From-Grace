
UNIT_W = 16;
UNIT_H = 16;
for (_xx = 0; _xx < room_width; _xx += UNIT_W) {
	for (_yy = 0; _yy < room_height; _yy += UNIT_H) {
		if (position_meeting(_xx,_yy,obj_wall)) {
			instance_create_depth(_xx & ~15,_yy & ~15,-1,obj_solid);
			show_debug_message("a");
		}
	}
}

alarm[1] = 1;

