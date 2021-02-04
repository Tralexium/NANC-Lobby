/// scrFBShakeCam(shake_dur, shake_x_dist, shake_y_dist, shake_x_repeats, shake_y_repeats)

var _shake_dur = argument[0];
var _shake_x_dist = argument[1];
var _shake_y_dist = argument[2];
var _shake_x_repeats = argument[3];
var _shake_y_repeats = argument[4];

if(instance_exists(objAlexFBCam)) {
    objAlexFBCam.shake_t = 0;
    objAlexFBCam.shake_dur = _shake_dur;
    objAlexFBCam.shake_x_dist = _shake_x_dist;
    objAlexFBCam.shake_y_dist = _shake_y_dist;
    objAlexFBCam.shake_x_repeats = _shake_x_repeats;
    objAlexFBCam.shake_y_repeats = _shake_y_repeats;
}
