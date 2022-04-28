/// @description initialize game

enum input {
	U = 0,
	D,
	L,
	R,
	JUMP,
	PHASE,
	HOOK,
	length
}


// input.length[player][input]
global.down     = array_create(input.length,0);
global.last     = array_create(input.length,0);
global.pressed  = array_create(input.length,0);
global.released = array_create(input.length,0);

global.binding  = array_create(input.length,0);

for (var i = 0; i < input.length; i++) {
	var v = -1;
	switch i {
		case input.L: v = ord("A"); break;
		case input.D: v = ord("S"); break;
		case input.U: v = ord("W"); break;
		case input.R: v = ord("D"); break;
		case input.JUMP: v = vk_space; break;
		case input.PHASE: v = vk_shift; break;
		case input.HOOK: v = ord("L"); break;
	}
	global.binding[i] = v;
}

room_goto(Start);
