extends StaticBody2D

var velY : float = -5.0





func _physics_process(delta):
	position.x = snapped(position.x,1)
	
	
	position.y += velY
	velY += 0.3
	rotation_degrees += 5
	
	if position.y > 285:
		position.y = 85
		velY = -5.0
		position.x = RandomNumberGenerator.new().randf_range(48,48)
	
	# Repsawning this bread leads to reseting of pos
	
	print(position.x)
	if !position.x == 96:
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position:x",96,0.5).set_ease(Tween.EASE_IN_OUT)
	else:
		pass
	
	
	
	#print(position.x)
