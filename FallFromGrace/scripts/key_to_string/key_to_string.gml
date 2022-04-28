/// key_to_string( key )
/*//
Script by D.W. O'Boyle (@dwoboyle)
How to use:
Simply call this script in a draw_text function. 
argument0 should be a keyboard key such as vk_enter or ord('Z').
//*/

function key_to_string(arg) {
	if(arg > 48 && arg < 91) {
		return chr(arg); 
	}
	switch(arg) {
	    case 8: return "Backspace"; break;
	    case 9: return "Tab"; break;
	    case 13: return "Enter"; break;
	    case 16: return "Shift"; break;
	    case 17: return "Ctrl"; break;
	    case 18: return "Alt"; break;
	    case 19: return "Pause/Break"; break;
	    case 20: return "CAPS"; break;
	    case 27: return "Esc"; break;
		case 32: return "Space"; break;
	    case 33: return "Page Up"; break;
	    case 34: return "Page Down"; break;
	    case 35: return "End"; break;
	    case 36: return "Home"; break;
	    case 37: return "Left Arrow"; break;
	    case 38: return "Up Arrow"; break;
	    case 39: return "Right Arrow"; break;
	    case 40: return "Down Arrow"; break;
	    case 45: return "Insert"; break;
	    case 46: return "Delete"; break;
	    case 96: return "Numpad 0"; break;
	    case 97: return "Numpad 1"; break;
	    case 98: return "Numpad 2"; break;
	    case 99: return "Numpad 3"; break;
	    case 100: return "Numpad 4"; break;
	    case 101: return "Numpad 5"; break;
	    case 102: return "Numpad 6"; break;
	    case 103: return "Numpad 7"; break;
	    case 104: return "Numpad 8"; break;
	    case 105: return "Numpad 9"; break;
	    case 106: return "Numpad *"; break;
	    case 107: return "Numpad +"; break;
	    case 109: return "Numpad -"; break;
	    case 110: return "Numpad ."; break;
	    case 111: return "Numpad /"; break;
	    case 112: return "F1"; break;
	    case 113: return "F2"; break;
	    case 114: return "F3"; break;
	    case 115: return "F4"; break;
	    case 116: return "F5"; break;
	    case 117: return "F6"; break;
	    case 118: return "F7"; break;
	    case 119: return "F8"; break;
	    case 120: return "F9"; break;
	    case 121: return "F10"; break;
	    case 122: return "F11"; break;
	    case 123: return "F12"; break;
	    case 144: return "Num Lock"; break;
	    case 145: return "Scroll Lock"; break;
	    case 186: return ";"; break;
	    case 187: return "="; break;
	    case 188: return ","; break;
	    case 189: return "-"; break;
	    case 190: return "."; break;
	    case 191: return "\\"; break;
	    case 192: return "`"; break;
	    case 219: return "/"; break;
	    case 220: return "["; break;
	    case 221: return "]"; break;
	    case 222: return "'"; break;
		case gp_face1: return "A/cross"; break;
		case gp_face2: return "B/circle"; break;
		case gp_face3: return "X/square"; break;
		case gp_face4: return "Y/triangle"; break;
		case gp_shoulderl: return "LB/L1"; break;
		case gp_shoulderlb: return "LT/L2"; break;
		case gp_shoulderr: return "RB/R1"; break;
		case gp_shoulderrb: return "RT/R2"; break;
		case gp_select: return "Select"; break;
		case gp_start: return "Start"; break;
		case gp_stickl: return "Left stick/L3"; break;
		case gp_stickr: return "Right stick/R3"; break;
		case gp_padu: return "D-pad up"; break;
		case gp_padd: return "D-pad down"; break;
		case gp_padl: return "D-pad left"; break;
		case gp_padr: return "D-pad right"; break;
		default: return string(arg); break;
	}
}
