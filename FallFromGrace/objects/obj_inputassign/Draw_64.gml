/// @description Insert description here
// You can write your code in this editor

if (selected) {
	draw_set_color(c_red);
}
else{
	draw_set_color(c_white);
}
draw_set_font(keybind_text);

switch(keyType){
	case "Left":
		draw_text(500, 90, keyType+": "+key_to_string(global.new_key_map[0]));
		break;
	case "Right":
		draw_text(500, 154, keyType+": "+key_to_string(global.new_key_map[1]));
		break;
	case "Up":
		draw_text(500, 218, keyType+": "+key_to_string(global.new_key_map[2]));
		break;
	case "Down":
		draw_text(500, 282, keyType+": "+key_to_string(global.new_key_map[3]));
		break;
	case "Jump":
		draw_text(500, 346, keyType+": "+key_to_string(global.new_key_map[4]));
		break;
	case "Phase":
		draw_text(500, 410, keyType+": "+key_to_string(global.new_key_map[5]));
		break;
	case "Hook":
		draw_text(500, 474, keyType+": "+key_to_string(global.new_key_map[6]));
		break;
}
