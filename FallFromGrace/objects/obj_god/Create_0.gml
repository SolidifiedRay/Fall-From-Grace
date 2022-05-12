text = instance_create_depth(x,y,depth+1, obj_worldtext);
image_xscale = 1;
image_yscale = 1;

var _y = y;
var counter = 0;
while (!collision_point(x,_y,obj_wall,false,false) && counter < 9999) {
	_y++;
	counter++;
	text.y = _y;
}

text.text = "["+string_upper(key_to_string(global.phase_key)) + "]\nFALL";
