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
	global.new_key_map[0] = global.left_key; 
	global.new_key_map[1] = global.right_key; 
	global.new_key_map[2] = global.up_key; 
	global.new_key_map[3] = global.down_key; 
	global.new_key_map[4] = global.jump_key;
	global.new_key_map[5] = global.phase_key;
	global.new_key_map[6] = global.hook_key;
}
