/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_green);
draw_set_alpha(1);
draw_circle(x,y,(checkpointcount - obj_player.checknum) * 1 + 32,0);

draw_set_alpha(0.5);

draw_set_colour(c_black);
draw_line_width(x,y,obj_player.x,obj_player.y,4);
draw_set_colour(c_white);
draw_line_width(x,y,obj_player.x,obj_player.y,3);


