///scrDrawTextOutlineTransformed(x,y,string,textcolor,outlinecolor,xscale,yscale,angle)
///draws any text with an outline
///argument0 - text X position
///argument1 - text Y position
///argument2 - text string
///argument3 - color of the text inside the outline
///argument4 - color of the text outline
///argument5 - xscale
///argument6 - yscale
///argument7 - angle

var textX = argument0;
var textY = argument1;
var textStr = argument2;
var textColor = argument3;
var outlineColor = argument4;
var xscale = argument5;
var yscale = argument6;
var angle = argument7;

//draw the text outline
draw_set_color(outlineColor);
draw_text_transformed(textX-1,textY+1,textStr,xscale,yscale,angle);
draw_text_transformed(textX-1,textY,textStr,xscale,yscale,angle);
draw_text_transformed(textX-1,textY-1,textStr,xscale,yscale,angle);
draw_text_transformed(textX+1,textY+1,textStr,xscale,yscale,angle);
draw_text_transformed(textX+1,textY,textStr,xscale,yscale,angle);
draw_text_transformed(textX+1,textY-1,textStr,xscale,yscale,angle);
draw_text_transformed(textX,textY+1,textStr,xscale,yscale,angle);
draw_text_transformed(textX,textY-1,textStr,xscale,yscale,angle);

//draw the text itself
draw_set_color(textColor);
draw_text_transformed(textX,textY,textStr,xscale,yscale,angle);
