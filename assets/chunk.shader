shader_type canvas_item;

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453) * 0.02;
}

void fragment() {
	// chunky frags
	float chunk_size = 2.0;
    COLOR.xyz = texture(TEXTURE, UV - vec2(mod(UV.x, SCREEN_PIXEL_SIZE.x * chunk_size), mod(UV.y, SCREEN_PIXEL_SIZE.y * chunk_size))).xyz;
	
	// grain
	float amount = 0.12;
    float randomIntensity =
		fract(10000.0 * sin((FRAGCOORD.x + FRAGCOORD.y * TIME) * 3.14));
	amount *= randomIntensity;
	
	COLOR.xyz += amount;
}