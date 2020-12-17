///scrInView
// Checks if the object is in view

if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0])) {
   return true;
}

return false;
