draw_set_colour(c_white);
draw_set_alpha(1);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x11,y11);
draw_vertex(xx11,yy11);
draw_vertex(x21,y12);
draw_vertex(xx21,yy12);
draw_vertex(x22,y22);
draw_vertex(xx22,yy22);
draw_vertex(x12,y21);
draw_vertex(xx12,yy21);
draw_vertex(x11,y11);
draw_vertex(xx11,yy11);
draw_primitive_end();


