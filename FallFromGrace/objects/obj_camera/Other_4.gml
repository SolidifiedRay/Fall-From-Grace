/// @description Insert description here
// You can write your code in this editor

#region cameras

// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

target = self;
view_camera[0] = camera_create_view(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0, noone, -1, -1, 1000, 1000);
var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 1366 / 2;
var _ypos = (_dheight / 2) - 768 / 2;
window_set_rectangle(_xpos, _ypos, 1366, 768);
surface_resize(application_surface, 1366, 768);

// startx = camera_get_view_x(view_camera[0]);
// starty = camera_get_view_y(view_camera[0]);
starth = camera_get_view_height(view_camera[0]);
startw = camera_get_view_width(view_camera[0]);

oldx = camera_get_view_x(view_camera[0]);
oldy = camera_get_view_y(view_camera[0]);
oldh = camera_get_view_height(view_camera[0]);
oldw = camera_get_view_width(view_camera[0]);

frame = instance_position(x,y,obj_frame);
if (frame != noone) {
	viewx = frame.xport;
	viewy = frame.yport;
	viewh = frame.hport;
	vieww = frame.wport;
	target = frame;
} else {
	viewx = x - startw / 2;
	viewy = y - starth / 2;
	vieww = startw;
	viewh = starth;
	target = self;
}

lerpw = lerp(oldw, vieww, 1);
lerph = lerp(oldh, viewh, 1);
lerpx = lerp(oldx, viewx, 1);
lerpy = lerp(oldy, viewy, 1);
newx = clamp(lerpx, 0, room_width - lerpw);
newy = clamp(lerpy, 0, room_height - lerph);
camera_set_view_target(view_camera[0],noone);
camera_set_view_pos(view_camera[0], newx, newy);
camera_set_view_size(view_camera[0], lerpw, lerph);

#endregion


global.psystem = part_system_create_layer("instances",false);
global.star1 = part_type_create();
part_type_sprite(global.star1, spr_star,1,1,0);
part_type_blend(global.star1, 1);
part_type_life(global.star1, 8, 32);
part_type_color1(global.star1, c_yellow);

global.star2 = part_type_create();
part_type_sprite(global.star2, spr_star,1,1,0);
part_type_blend(global.star2, 1);
part_type_life(global.star2, 8, 32);
part_type_color1(global.star2, c_white);

global.star3 = part_type_create();
part_type_sprite(global.star3, spr_star,1,1,0);
part_type_blend(global.star3, 1);
part_type_life(global.star3, 8, 32);
part_type_color1(global.star3, c_aqua);

global.blob1 = part_type_create();
part_type_sprite(global.blob1,spr_blob,1,1,0);
part_type_blend(global.blob1,1);
part_type_life(global.blob1,8,32);
part_type_color1(global.blob1,c_white);
part_type_speed(global.blob1,0.05,0.2,0,0);
part_type_direction(global.blob1,90,90,0,0);

global.blob2 = part_type_create();
part_type_sprite(global.blob2,spr_blob,1,1,0);
part_type_blend(global.blob2,1);
part_type_life(global.blob2,8,32);
part_type_color_mix(global.blob2,c_red,c_yellow);
part_type_speed(global.blob2,0.05,0.2,0,0);
part_type_direction(global.blob2,90,90,0,0);
