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

global.inputstr = array_create(input.length,"");


// input.length[player][input]
global.down     = array_create(input.length,0);
global.last     = array_create(input.length,0);
global.pressed  = array_create(input.length,0);
global.released = array_create(input.length,0);

global.binding  = array_create(input.length,0);

for (var i = 0; i < input.length; i++) {
	var v = -1;
	var label = "";
	switch i {
		case input.L: 
			v = ord("A");
			label = "Left";
			break;
		case input.D:
			v = ord("S");
			label = "Down";
			break;
		case input.U: 
			v = ord("W");
			label = "Up"; 
			break;
		case input.R: 
			v = ord("D"); 
			label = "Right";
			break;
		case input.JUMP: 
			v = vk_space; 
			label = "Jump";
			break;
		case input.PHASE: 
			v = vk_shift; 
			label = "Phase";
			break;
		case input.HOOK: 
			v = ord("L"); 
			label = "Grapple";
			break;
	}
	global.binding[i] = v;
	global.inputstr[i] = label;
}

room_goto(Start);
