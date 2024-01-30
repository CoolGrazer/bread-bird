extends StaticBody2D

var velY : float = -5.0




func _physics_process(delta):
	position.y += velY
	velY += 0.3
	rotation_degrees += 5
	
	#print(abs(position.x - 96))
	
	position.x = lerp(position.x,96.0,1)
	
	if position.y > 285:
		position.y = 85
		velY = -5.0
		position.x = RandomNumberGenerator.new().randf_range(48,192 - 48)
	
	#position.x = snapped(position.x,1)
	print(position.x)
