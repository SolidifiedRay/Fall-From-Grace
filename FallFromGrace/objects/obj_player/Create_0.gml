/// @desc

// init player movement variables
hsp = 0;
vsp = 0;
grv = 0.2;
maxsp = 12;
walksp = 6;
walkinc = walksp/4;
walkdec = walksp/8;
airsp = 6;
airinc = airsp/8;
airdec = airsp/12;

in_wall_slide = false;
wall_slide_timer = 0;
wall_slide_dir = 1;
wall_jump_trail = 0;
wall_jump_timer = 20;

grounded = 0;

jumpsp = 4.7;
wjumpvsp = 4;
wjumphsp = 6.1;

wjumpinc = 0.1;
wjumpdec = 0.1;

hookgrv = 1;
hookinc = 0.3;
hookdec = 0.1;
hookready = true;
hooklen = 0;

canphase = true;
in_phase = false;
can_double_jump = false;
//in_dash = false;
//dash_timer = 0;
//dash_length = 4;
//num_dash_left = 1;
 

hvec = 0;

left = 0;
right = 0;
up = 0;
down = 0;
jump = 0;

hook = 0;

rotation = 0;
trailcolor = c_white;
facing = 1;

instance_create_layer(x,y-64,"instances",obj_camera);
dead = false;
winning = false;

totalframes = 0;
frames = totalframes mod 60;
seconds = (totalframes div 60) mod 60;
minutes = seconds div 60;

respawn = true;
spawnx = x;
spawny = y;

aimx = x;
aimy = y;
aimtrue = false;

circlehook = false;

tlen = 120;
tcounter = 0;
tx = array_create(tlen, x);
ty = array_create(tlen, y);
tcolor = array_create(tlen, c_white);
talpha = array_create(tlen, 1);
