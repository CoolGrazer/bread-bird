shader_type canvas_item;

uniform vec2 direction;

uniform float scrollSpeed;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE,(UV * vec2(2,1)) + vec2(direction * -TIME / 60.0 * scrollSpeed));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
