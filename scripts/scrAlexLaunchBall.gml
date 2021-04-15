/// scrAlexLaunchBall(cannon_num, ball_type[optional])

// Only used in "objAlexMinigameCannonController"

var _cannon_num = argument[0];
var _ball_type = ball_type.normal;
if(argument_count > 1)
    _ball_type = argument[1];

with(cannon[_cannon_num]) {
    shoot = true;
    ball = _ball_type;
}
