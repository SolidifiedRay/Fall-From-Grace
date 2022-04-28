for (var i = 0; i < input.length; i++) {
	global.last[i] = global.down[i];
	global.down[i] = keyboard_check(global.binding[i]);
	global.pressed[i] = global.down[i] && !global.last[i];
	global.released[i] = !global.down[i] && global.last[i];
}


