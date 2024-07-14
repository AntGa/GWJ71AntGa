shader_type canvas_item;

uniform bool flash_enabled = false;

void fragment() {
    vec4 color = texture(TEXTURE, FRAGCOORD.xy / TEXTURE_PIXEL_SIZE);
    if (flash_enabled) {
        color.rgb = vec3(1.0); // turn white
    }
    COLOR = color;
}
