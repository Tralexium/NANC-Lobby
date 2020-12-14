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
// Description : Array and textureless GLSL 2D/3D/4D simplex 
//               noise functions.
//      Author : Ian McEwan, Ashima Arts.
//  Maintainer : ijm
//     Lastmod : 20110822 (ijm)
//     License : Copyright (C) 2011 Ashima Arts. All rights reserved.
//               Distributed under the MIT License. See LICENSE file.
//               https://github.com/ashima/webgl-noise
// 

// Modified version by: Tralexium


varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec2 u_cam_offset;
uniform vec3 u_base_col_hsv;

const float STEPS = 8.0;
const float CUTOFF = 0.5; //depth less than this, show white wall
const vec2  OFFSET = vec2(0.01,0.01); //drop shadow offset


vec3 mod289(vec3 x) {
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 mod289(vec4 x) {
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 permute(vec4 x) {
    return mod289(((x*34.0)+1.0)*x);
}

vec4 taylorInvSqrt(vec4 r)
{
    return 1.79284291400159 - 0.85373472095314 * r;
}

float snoise(vec3 v)
{ 
    const vec2  C = vec2(1.0/6.0, 1.0/3.0) ;
    const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);
    
    // First corner
    vec3 i  = floor(v + dot(v, C.yyy) );
    vec3 x0 =   v - i + dot(i, C.xxx) ;
    
    // Other corners
    vec3 g = step(x0.yzx, x0.xyz);
    vec3 l = 1.0 - g;
    vec3 i1 = min( g.xyz, l.zxy );
    vec3 i2 = max( g.xyz, l.zxy );
    
    //   x0 = x0 - 0.0 + 0.0 * C.xxx;
    //   x1 = x0 - i1  + 1.0 * C.xxx;
    //   x2 = x0 - i2  + 2.0 * C.xxx;
    //   x3 = x0 - 1.0 + 3.0 * C.xxx;
    vec3 x1 = x0 - i1 + C.xxx;
    vec3 x2 = x0 - i2 + C.yyy; // 2.0*C.x = 1/3 = C.y
    vec3 x3 = x0 - D.yyy;      // -1.0+3.0*C.x = -0.5 = -D.y
    
    // Permutations
    i = mod289(i); 
    vec4 p = permute( permute( permute( 
               i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
             + i.y + vec4(0.0, i1.y, i2.y, 1.0 )) 
             + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));
    
    // Gradients: 7x7 points over a square, mapped onto an octahedron.
    // The ring size 17*17 = 289 is close to a multiple of 49 (49*6 = 294)
    float n_ = 0.142857142857; // 1.0/7.0
    vec3  ns = n_ * D.wyz - D.xzx;
    
    vec4 j = p - 49.0 * floor(p * ns.z * ns.z);  //  mod(p,7*7)
    
    vec4 x_ = floor(j * ns.z);
    vec4 y_ = floor(j - 7.0 * x_ );    // mod(j,N)
    
    vec4 x = x_ *ns.x + ns.yyyy;
    vec4 y = y_ *ns.x + ns.yyyy;
    vec4 h = 1.0 - abs(x) - abs(y);
    
    vec4 b0 = vec4( x.xy, y.xy );
    vec4 b1 = vec4( x.zw, y.zw );
    
    //vec4 s0 = vec4(lessThan(b0,0.0))*2.0 - 1.0;
    //vec4 s1 = vec4(lessThan(b1,0.0))*2.0 - 1.0;
    vec4 s0 = floor(b0)*2.0 + 1.0;
    vec4 s1 = floor(b1)*2.0 + 1.0;
    vec4 sh = -step(h, vec4(0.0));
    
    vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
    vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;
    
    vec3 p0 = vec3(a0.xy,h.x);
    vec3 p1 = vec3(a0.zw,h.y);
    vec3 p2 = vec3(a1.xy,h.z);
    vec3 p3 = vec3(a1.zw,h.w);
    
    //Normalise gradients
    vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2, p2), dot(p3,p3)));
    p0 *= norm.x;
    p1 *= norm.y;
    p2 *= norm.z;
    p3 *= norm.w;
    
    // Mix final noise value
    vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
    m = m * m;
    return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1), 
                                  dot(p2,x2), dot(p3,x3) ) );
}

//END ASHIMA /////////////////////////////////////////////////


vec3 hsv2rgb(vec3 c){
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 P = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(P - K.xxx, 0.0, 1.0), c.y);
}

float getNoise(vec2 uv, float t){
    
    //given a uv coord and time - return a noise val in range 0 - 1
    //using ashima noise
    
    //octave 1
    float SCALE = 0.50;
    float noise = snoise( vec3(uv.x*SCALE + t,uv.y*SCALE + t , 0.0));
    
    //octave 2 - more detail
    SCALE = 1.0;
    noise += snoise( vec3(uv.x*SCALE + t,uv.y*SCALE , 0.0))* 0.2;
    
    //move noise into 0 - 1 range    
    noise = (noise/2.0 + 0.5);
    
    //make deeper rarer
    //noise = pow(noise,2.);
    
    return noise;
    
}

float getDepth(float n){
 
    //given a 0-1 value return a depth,
    //e.g. distance into the hole
    
    //remap remaining non-cutoff region to 0 - 1
float d = (n - CUTOFF) / (1.0 - CUTOFF); 
        
    //step it
    d = floor(d*STEPS)/STEPS;
    
    return d;
    
}

void main(){

    vec2 uv = (vec2(1.0, 1.0) - v_vTexcoord.xy*2.0) * vec2(-1.0, 1.0); //fragCoord.xy / iResolution.x;
    float noise_time = u_time;    
    vec3 col = vec3(0.0);
    
   float noise = getNoise(uv + u_cam_offset, noise_time);
    
    if (noise < CUTOFF){
        
        //base color
        col = hsv2rgb(vec3(u_base_col_hsv.r, u_base_col_hsv.y, u_base_col_hsv.z));
        
    } else {
    
      float depth = getDepth(noise);
        
        //calc HSV color
        float hue = u_base_col_hsv.x + depth/6.0 + 0.025; //rainbow hue
        float sat = u_base_col_hsv.y;
        float val = u_base_col_hsv.z - (depth*0.4); //deeper is darker
        
       //add bevel
        
       //get depth at offset position        
        float noiseOff = getNoise(uv + OFFSET + u_cam_offset, noise_time);
        float dOff = getDepth(noiseOff);
       
        //if depth of this pixel (d) is less (closer) than offset pixel (dOff)
        //then we are in shadow so darken       
        val -= depth - dOff; 
        
        col = hsv2rgb(vec3(hue, sat, val));
   }
    
    //post proc
   //vertical gradient grey
    col *= 0.7 + (-v_vTexcoord.y * 0.3); //0.7 + (fragCoord.y/iResolution.y *0.3);
    
    gl_FragColor = vec4(col, 1.0);
}
