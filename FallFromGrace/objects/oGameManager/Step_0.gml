if room == room_end {
	if WIN {
		SAVE_ROOM = room1;
	}
	if keyboard_check(ord("R")){
		room_goto(SAVE_ROOM);
		WIN = false;
	}
}

if keyboard_check(ord("1")){
	WIN = false;
	room_goto(room1);
}
if keyboard_check(ord("2")){
	WIN = false;
	room_goto(room2);
}



