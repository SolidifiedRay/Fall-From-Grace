/// @description Insert description here
// You can write your code in this editor
xdest = obj_player.x + 8 * obj_player.hsp;
ydest = obj_player.y + 8 * obj_player.vsp + obj_player.vvec * 32;
x = lerp(x, xdest, 0.2);
y = lerp(y, ydest, 0.2);