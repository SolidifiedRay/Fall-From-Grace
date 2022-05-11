/// @description Insert description here
// You can write your code in this editor
if (selected && keyboard_key){
	switch(keyType){
		case "Left":
			global.new_key_map[0] = keyboard_key; 
			break;
		case "Right":
			global.new_key_map[1] = keyboard_key; 
			break;
		case "Up":
			global.new_key_map[2] = keyboard_key; 
			break;
		case "Down":
			global.new_key_map[3] = keyboard_key; 
			break;
		case "Jump":
			global.new_key_map[4] = keyboard_key; 
			break;
		case "Phase":
			global.new_key_map[5] = keyboard_key; 
			break;
		case "Hook":
			global.new_key_map[6] = keyboard_key; 
			break;
	}
	selected = false;
}

if (keyboard_check(vk_tab)){
	global.new_key_map[0] =ord("A");
	global.new_key_map[1] =ord("D");
	global.new_key_map[2] =ord("W");
	global.new_key_map[3] = ord("S");
	global.new_key_map[4] = vk_space;
	global.new_key_map[5] = vk_shift;
	global.new_key_map[6] = ord("L");
}

if (mouse_x > bbox_left && mouse_x < bbox_right
&& mouse_y > bbox_top && mouse_y < bbox_bottom) {
	image_blend = c_aqua;
} else {
	image_blend = c_white;
}
