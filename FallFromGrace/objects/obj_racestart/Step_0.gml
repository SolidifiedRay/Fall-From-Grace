/// @description Insert description here
// You can write your code in this editor

frames = race mod 60;
seconds = (race div 60) mod 60;
minutes = (race div 60) div 60;

if (started) race++;

image_blend = started ? c_grey : c_green;
