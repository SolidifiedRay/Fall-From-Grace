draw_primitive_begin(pr_trianglestrip);

for (i = 0; i < tlen; i+= 1) {
	tcnow = (i + tcounter + tlen) mod tlen;
	tcnext = (tcnow + 1 + tlen) mod tlen;
	//tcdir = tdir[tcnow];
	twid = 16;
	tcdir = point_direction(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]);
	//tdir = rotation;
	if (point_distance(tx[tcnow],ty[tcnow],tx[tcnext],ty[tcnext]) == 0) {
		tcdir = rotation;
	}

	talpha = 1;
	twid *= i / tlen;
	

	x1 = tx[tcnow];
	y1 = ty[tcnow];
	

	x11 = x1+lengthdir_x(twid,tcdir+90);
	y11 = y1+lengthdir_y(twid,tcdir+90);
	x12 = x1+lengthdir_x(twid,tcdir-90);
	y12 = y1+lengthdir_y(twid,tcdir-90);



	draw_vertex_colour(x11, y11,color,talpha);
	draw_vertex_colour(x12, y12,color,talpha);
	//draw_circle(x11, y11,2,1);
	//draw_circle(x12, y12,2,1);
	//draw_text(x11,y11,i);
	//draw_text(x12,y12,i);
	
}
draw_primitive_end();
