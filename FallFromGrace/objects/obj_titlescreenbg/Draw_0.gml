var jiggle = 8;
var x11 = random(jiggle);
var x12 = random(jiggle);
var x21 = room_width - random(jiggle);
var x22 = room_width - random(jiggle);
var y11 = random(jiggle);
var y12 = random(jiggle);
var y21 = room_height - random(jiggle);
var y22 = room_height - random(jiggle);

draw_set_color(c_white);
var thickness = 32;
draw_line_width(x11,y11,x21,y12,thickness);
draw_line_width(x21,y12,x22,y21,thickness);
draw_line_width(x22,y21,x12,y22,thickness);
draw_line_width(x12,y22,x11,y11,thickness);
