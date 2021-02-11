///scrFBJump(hspeed, jump_force)
// Should only be used inside objAlexFinalBoss

while(bbox_bottom > ground_level)
    y--;

hspeed = argument[0];
vspeed = abs(argument[1]) * -1;
gravity = default_gravity;
