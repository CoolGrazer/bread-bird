extends Sprite2D


@export_range(0,2) var me = 0

var selected : bool = false

func _process(delta):
	if _mouseCloseToDimensions(104/2,48/2) and Input.is_action_just_pressed("Click"):
		frame = 1
	elif Input.is_action_just_released("Click") and not _mouseCloseToDimensions(104/2,48/2):
		frame = 0
		selected = false
	elif Input.is_action_just_released("Click") and _mouseCloseToDimensions(104/2,48/2):
		frame = 2
		get_parent().get_child(9).play("FadeIn")
		selected = true
		
		
	# Maybe add small intro if have time
	
	
	#print(if me == 2 and get_parent())
	
	if selected == true and get_parent().get_child(2).playing == false and me == 2:
		get_tree().change_scene_to_file("res://Scenes/Games/RhythmTest.tscn")
	
	
	if selected == true and get_parent().get_child(2).volume_db < -20 and me == 0:
		get_tree().change_scene_to_file("res://Scenes/Games/BreadBird.tscn")
	
	pass
	
	


func _mouseCloseToDimensions(x,y):
	pass
	
	var mouseLocalToMe : Vector2 = Vector2.ZERO
	
	mouseLocalToMe = abs(global_position - get_global_mouse_position())
	if mouseLocalToMe.x < x and mouseLocalToMe.y < y:
		return true
	else:
		return false
