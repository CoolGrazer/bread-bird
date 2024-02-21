extends Sprite2D


func _process(delta):
	if _mouseCloseToDimensions(104/2,48/2) and Input.is_action_just_pressed("Click"):
		frame = 1
	elif Input.is_action_just_released("Click") and not _mouseCloseToDimensions(104/2,48/2):
		frame = 0
	elif Input.is_action_just_released("Click") and _mouseCloseToDimensions(104/2,48/2):
		frame = 2

	print(global_position - get_global_mouse_position())


func _mouseCloseToDimensions(x,y):
	pass
	
	var mouseLocalToMe : Vector2 = Vector2.ZERO
	
	mouseLocalToMe = abs(global_position - get_global_mouse_position())
	if mouseLocalToMe.x < x and mouseLocalToMe.y < y:
		return true
	else:
		return false
