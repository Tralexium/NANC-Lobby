//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
//uniform vec2 u_resolution;

const float PI = 3.14159265359;

void main()
{
    //vec2 aspect = vec2(u_resolution.x / u_resolution.y, 1.);
    //vec2 texel_pos = -aspect + 2.*w/u_resolution.xy * aspect;
    //vec2 texel_pos = -aspect + vec2(-1.0, -1.0) + v_vTexcoord.xy * aspect;
    
    vec2 texel_pos = vec2(1.0, 1.0) - v_vTexcoord.xy*2.0;
    float strength = fract(u_time - 2.5*(length(texel_pos) * 0.5));
    
    // Determine the color based on the strength
    vec3 col;
    
    // Red
    if(strength > 0.166 * 5.) {
        col = vec3(1., 0.47, 0.455);
    } 
    // Orange
    else if (strength > 0.166 * 4.) {
        col = vec3(0.99, 0.75, 0.40);
    }
    // Yellow
    else if (strength > 0.166 * 3.) {
        col = vec3(0.99, 0.99, 0.59);
    }
    // Green
    else if (strength > 0.166 * 2.) {
        col = vec3(0.62, 0.88, 0.62);
    }
    // Blue
    else if (strength > 0.166) {
        col = vec3(0.62, 0.755, 0.81);
    }
    // Purple
    else {
        col = vec3(0.8, 0.6, 0.79);
    }
    
    gl_FragColor = vec4(col, texture2D( gm_BaseTexture, v_vTexcoord ).a);
}

