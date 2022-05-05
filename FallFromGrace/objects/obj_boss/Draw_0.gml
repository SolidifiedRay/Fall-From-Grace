/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_lime);
draw_set_alpha(1);
var steps = 24;

draw_primitive_begin(pr_trianglestrip);
for (a = 0; a < abs(angletotal); a ++) {
	
	i = a * sign(angletotal);
	orad = 1/20 * i + 4;
	irad = 1/20 * i;
	_xi = lengthdir_x(irad, i);
	_yi = lengthdir_y(irad, i);
	
	_xo = lengthdir_x(orad, i);
	_yo = lengthdir_y(orad, i);


	draw_vertex(x+_xi, y-_yi);
	draw_vertex(x+_xo, y-_yo);
}
draw_primitive_end();

draw_set_alpha(0.5);
if (checkpoint0.checked) {
	//draw_set_colour(c_black);
	//draw_line_width(x,y,obj_player.x,obj_player.y,4);
	draw_set_colour(c_lime);
	draw_line_width(x,y,obj_player.x,obj_player.y,3);
}
