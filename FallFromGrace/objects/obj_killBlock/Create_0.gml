/// @description Insert description here
// You can write your code in this editor

outline = instance_create_depth(x,y,depth+1,obj_phasekill_outline);
w = 2;
outline._x1 = bbox_left - w;
outline._x2 = bbox_right + w;
outline._y1 = bbox_top - w;
outline._y2 = bbox_bottom + w;
outline.x11 = bbox_left - w;
outline.x21 = bbox_right + w;
outline.y11 = bbox_top - w;
outline.y21 = bbox_bottom + w;
outline.x12 = bbox_left - w;
outline.x22 = bbox_right + w;
outline.y12 = bbox_top - w;
outline.y22 = bbox_bottom + w;

glitterspawn = (sprite_height * sprite_width) / 16384;
timer = 0;
