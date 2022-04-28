/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_enter)){
	room_goto(LevelRoom);
	global.left_key = global.new_key_map[0];
	global.right_key = global.new_key_map[1];
	global.up_key = global.new_key_map[2];
	global.down_key = global.new_key_map[3];
	global.jump_key = global.new_key_map[4];
	global.phase_key = global.new_key_map[5];
	global.hook_key = global.new_key_map[6];
}
