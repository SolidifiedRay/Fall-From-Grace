/// @description Insert description here
// You can write your code in this editor


if (obj_racestart.started == true) {
	obj_racestart.started = false;
	for (var i = 0; i < instance_number(obj_racecheckpoint); ++i;)
	{
	    checkpoint = instance_find(obj_racecheckpoint,i);
		if (checkpoint.checked == false) obj_racestart.started = true;
	}
}
