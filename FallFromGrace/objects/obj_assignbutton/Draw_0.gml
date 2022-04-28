/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_set_font(fnt_subtitle);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(bbox_right,y+32,label + ": " + string(global.binding[bind]));
