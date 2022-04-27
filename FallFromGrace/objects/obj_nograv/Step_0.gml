_x1 = bbox_left;
_y1 = bbox_top;
_x2 = bbox_right;
_y2 = bbox_bottom;



x11 = lerp(x11, _x1 - random_range(w1,w2), lerpfactor);
y11 = lerp(y11, _y1 - random_range(w1,w2), lerpfactor);

x21 = lerp(x21, _x2 + random_range(w1,w2), lerpfactor);
y21 = lerp(y21, _y2 + random_range(w1,w2), lerpfactor);

x22 = lerp(x22, _x2 + random_range(w1,w2), lerpfactor);
y22 = lerp(y22, _y2 + random_range(w1,w2), lerpfactor);

x12 = lerp(x12, _x1 - random_range(w1,w2), lerpfactor);
y12 = lerp(y12, _y1 - random_range(w1,w2), lerpfactor);

xx11 = lerp(xx11, _x1 - random_range(w3,w4), lerpfactor);
yy11 = lerp(yy11, _y1 - random_range(w3,w4), lerpfactor);

xx21 = lerp(xx21, _x2 + random_range(w3,w4), lerpfactor);
yy21 = lerp(yy21, _y2 + random_range(w3,w4), lerpfactor);

xx22 = lerp(xx22, _x2 + random_range(w3,w4), lerpfactor);
yy22 = lerp(yy22, _y2 + random_range(w3,w4), lerpfactor);

xx12 = lerp(xx12, _x1 - random_range(w3,w4), lerpfactor);
yy12 = lerp(yy12, _y1 - random_range(w3,w4), lerpfactor);




