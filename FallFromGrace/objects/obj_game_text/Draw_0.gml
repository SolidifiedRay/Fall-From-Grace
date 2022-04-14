draw_set_color(c_white);
if room == Level1 {
	draw_set_font(Font2);
	draw_text(20, 30, "(Shift) Through Space");
	draw_text(20, 50, "Fall From Grace");
	draw_text(600, 630, "Die (K)icking");
	draw_text(600, 650, "Die Screaming");
	draw_text(700, 250, "Hate the Sin");
	draw_text(700, 270, "Hate the Sinner");
}

if room == Level2 {
	draw_set_font(Font2);
	draw_text(100, 1050, "A [L]emur Swings");
	draw_text(805, 1050, "A Kami Flies");
}

if room == Level3 {
	draw_set_font(Font2);
 	draw_text(150, 960, "The only way is Through");
 	draw_text(1550, 1030, "Eat a God, esca[l]ate");
	draw_text(1550, 1050, "Flee the World, e[l]evate");
}

if room == Level4 {
	draw_set_font(Font2);
 	draw_text(220, 220, "In an empty box agian,");
 	draw_text(290, 240, "eh Sinmer?");
	draw_text(220, 50, "Clever. Wrong, but clever");
}
