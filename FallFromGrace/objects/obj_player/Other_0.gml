
// kill the player

dead = true;
audio_play_sound(sfx_dies,0,0);
instance_create_layer(x,y,"instances",obj_death);
