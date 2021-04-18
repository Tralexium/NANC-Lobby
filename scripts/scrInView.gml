///scrInView(leeway[optional])
// Checks if the object is in view

var _leeway = 0;
if(argument_count > 0)
    _leeway = argument[0];

if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, view_xview[0] - _leeway, view_yview[0] - _leeway, view_xview[0] + view_wview[0] + _leeway, view_yview[0] + view_hview[0] + _leeway)) {
   return true;
}

return false;
