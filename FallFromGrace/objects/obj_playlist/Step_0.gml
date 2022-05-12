prev = next;

switch room {
	case Init: case Start: case LevelRoom: case GrappleTest: case Setting:
		next = encore_piano; break;
	case Level1: case Level2: case PostLevel2: case Rocket: case LayerCake: case Phasekick:
		next = fading; break;
	case World0andBoss:
		next = gymnopedie_2;
		if (obj_boss.checkpoint0.checked) {
			next = obj_boss.dead ? fading : aqua_cat;
	}break;
	case WorldFinale: case ThankYouForPlaying:
		next = queen_of_the_night; break;
}

if (prev != next) {
	audio_stop_all();
}

if (!audio_is_playing(next) && audio_sound_is_playable(next)) {
	audio_play_sound(next,0,1);
}


