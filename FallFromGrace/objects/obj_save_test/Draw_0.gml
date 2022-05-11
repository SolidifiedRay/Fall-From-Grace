/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_small);
draw_set_color(outline);
draw_roundrect(bbox_left-4,bbox_top-4,bbox_right+4,bbox_bottom+4,false);
draw_set_color(bg);
draw_roundrect(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
draw_set_color(fg);
draw_text((bbox_left+bbox_right)/2,(bbox_top+bbox_bottom)/2,"Save and test");


