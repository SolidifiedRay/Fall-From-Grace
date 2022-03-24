 draw_set_color(c_white);

if room == room_end and not WIN {
	draw_set_font(myFontBig);
	draw_text(280, 250, "You die, press 'R' to restart.");
}
if room == room_end and WIN {
	draw_set_font(myFontBig);
	draw_text(280, 250, "You win! press 'R' to restart.");
}


if room == room1 {
	draw_set_font(myFontSmall);
	draw_text(40, 60, "Press 'A' and 'D' to move");
	draw_text(40, 80, "Press 'W' to jump");
	draw_text(40, 100, "Press 'Space' to phase");
	draw_text(500, 800, "Press 'K' to Kick on the wall");
	draw_text(600, 150, "Press 'L' to blow off one off your legs and double jump");
}