x = x & ~31;
y = y & ~31;
riftduration = 60;

riftsize = 64;
size = riftsize/2;
_x1 = x-size;
_y1 = y-size;
_x2 = x+size;
_y2 = y+size;

lerpfactor = 0.2;

w1 = -3;
w2 = 6;

w3 = -6;
w4 = 18;

x11 = _x1;
y11 = _y1;

x21 = _x2;
y21 = _y1;

x22 = _x2;
y22 = _y2;

x12 = _x1;
y12 = _y2;

xx11 = _x1;
yy11 = _y1;

xx21 = _x2;
yy21 = _y1;

xx22 = _x2;
yy22 = _y2;

xx12 = _x1;
yy12 = _y2;

alarm[1]=1;


