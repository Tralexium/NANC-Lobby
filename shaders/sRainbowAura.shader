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

//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_visibility;         // 0 to 1

const float blob_size = 30.0;        // Higher number = bigger size
const float blob_intensity = 110.0;  // Lower number = more glow

float blob(float in_x, float in_y, float fx, float fy)
{
   float xx = in_x+sin(u_time*fx)*1.0;
   float yy = in_y+cos(u_time*fy)*1.0;

   return blob_size/sqrt(xx*xx+yy*yy);
}

void main() 
{
   vec2 pos = vec2(-1.0, -1.0) + v_vTexcoord.xy*2.0;

   float blob_x = pos.x*2.0;
   float blob_y = pos.y*2.0;

   float blob_a = blob(blob_x,blob_y,3.3,3.2) + blob(blob_x,blob_y,3.9,3.0);
   float blob_b = blob(blob_x,blob_y,3.2,2.9) + blob(blob_x,blob_y,2.7,2.7);
   float blob_c = blob(blob_x,blob_y,2.4,3.3) + blob(blob_x,blob_y,2.8,2.3);
   
   vec3 all_blobs = vec3(blob_a, blob_b, blob_c)/blob_intensity;
   
   gl_FragColor = v_vColour * (texture2D( gm_BaseTexture, v_vTexcoord) + (vec4(all_blobs.x, all_blobs.y, all_blobs.z, 0.0) * vec4(u_visibility, u_visibility, u_visibility, 0.0)));
}

