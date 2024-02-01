shader_type canvas_item;


uniform vec4 bgColor : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE,(UV * vec2(2,1)));
	if (UV.x > 0.1)
	{
		COLOR = bgColor;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
