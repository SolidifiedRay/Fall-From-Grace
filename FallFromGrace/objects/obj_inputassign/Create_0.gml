for (var i = 0; i < input.length; i++) {
	newbutton = instance_create_depth(50, 72*i, 0, obj_assignbutton);
	newbutton.label = global.inputstr[i];
	newbutton.bind = i;
}

