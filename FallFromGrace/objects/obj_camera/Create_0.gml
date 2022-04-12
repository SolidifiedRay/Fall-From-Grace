/// @description Insert description here
// You can write your code in this editor

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

startx = camera_get_view_x(view_camera[0]);
starty = camera_get_view_y(view_camera[0]);
starth = camera_get_view_height(view_camera[0]);
startw = camera_get_view_width(view_camera[0]);


