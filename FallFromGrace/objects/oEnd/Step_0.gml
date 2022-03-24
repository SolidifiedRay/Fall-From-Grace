if room == room1 and place_meeting(x,y, oPlayer){
	room_goto(room2);
	SAVE_ROOM = room2;
}

if room == room2 and place_meeting(x,y, oPlayer){
	room_goto(room_end);
	WIN = true;
}
