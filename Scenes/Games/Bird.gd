extends Sprite2D

var xVel : float = 0.0


# Make the bird swim in random directions with an impulse based force


func _physics_process(delta):
	
	#position.y = (sin()) + 138
	
	if abs(xVel) < 0.2:
		frame = 2
		if randi_range(0,1) == 0 and position.x > 50:
			xVel = -2.0
			flip_h = true
		elif position.x < 142:
			xVel = 2.0
			flip_h = false
	
	print(frame)
	
	
	if abs(xVel) < 1.0:
		frame = 0
	elif abs(xVel) < 1.3:
		frame = 1
	
	position.x += xVel
	
	xVel *= 0.95
