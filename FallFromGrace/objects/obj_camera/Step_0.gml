/// @description Insert description here
// You can write your code in this editor
xdest = obj_player.x + 8 * obj_player.hsp;
ydest = obj_player.y + 8 * obj_player.vsp + obj_player.vvec * 32;
x = lerp(x, xdest, 0.3);
y = lerp(y, ydest, 0.3);

oldx = camera_get_view_x(view_camera[0]);
oldy = camera_get_view_y(view_camera[0]);
oldh = camera_get_view_height(view_camera[0]);
oldw = camera_get_view_width(view_camera[0]);

frame = instance_position(obj_player.x,obj_player.y,obj_frame);
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

lerpw = lerp(oldw, vieww, 0.075);
lerph = lerp(oldh, viewh, 0.075);
lerpx = lerp(oldx, viewx, 0.075);
lerpy = lerp(oldy, viewy, 0.075);
newx = clamp(lerpx, 0, room_width - lerpw);
newy = clamp(lerpy, 0, room_height - lerph);
camera_set_view_target(view_camera[0],noone);
camera_set_view_pos(view_camera[0], newx, newy);
camera_set_view_size(view_camera[0], lerpw, lerph);



