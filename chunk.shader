shader_type canvas_item;

void fragment() {
	// chunky frags
	float chunk_size = 4.0;
    COLOR.xyz = texture(TEXTURE, UV - vec2(mod(UV.x, SCREEN_PIXEL_SIZE.x * chunk_size), mod(UV.y, SCREEN_PIXEL_SIZE.y * chunk_size))).xyz;
}