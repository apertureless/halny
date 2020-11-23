
event_inherited();

scalemod = random_range(.6, 1);
width = 75*scalemod;
height = 64*scalemod;
xscale = choose(-1, 1);

special = random(1) <= .1;

image_index = special;

anim_timer = random(10);