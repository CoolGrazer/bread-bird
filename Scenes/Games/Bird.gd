extends Sprite2D

var xVel : float = 0.0


var animsPlaying : bool = false


var direction : int = 1

# Make the bird swim in random directions with an impulse based force


# Create necessary events in order to spawn bread

# Add input detection

# Add music..




func _physics_process(delta):
	
	
	
	position.y = (sin(abs(xVel)) * 8) + 138
	
	
	#if Input.is_action_just_pressed("Click"):
	#	_mouthOpen()
	#elif Input.is_action_just_released("Click"):
	#	_missedBreadToss()
	
	#if Input.is_action_just_pressed("Debug"):
	#	var b = preload("res://Scenes/Games/Bread.tscn").instantiate()
	#	get_parent().get_child(5).get_child(0).add_child(b)
	#	b.position = position + Vector2(10,-10)
	#	get_parent().get_child(3).play("BirdHeadBonk")
	
	
	
	
	if get_parent().get_child(3).current_animation == "":
		animsPlaying = false
	else:
		animsPlaying = true
	
	
	
	if animsPlaying == false:
		if abs(xVel) < 1.2:
			frame = 1
	
	position.x += xVel
	
	xVel *= 0.95


func _on_audio_stream_player_beat(beat):
	if fmod(beat,2) == 0:
		
		if abs(xVel) < 0.2:
			if animsPlaying == false:
				frame = 2
			if position.x > 142:
				direction = -1
				flip_h = true
				$Blur.position.x = -6
			elif position.x < 52:
				direction = 1
				flip_h = false
				$Blur.position.x = 6
			
			
			xVel = 2.0 * direction



func _mouthOpen():
	get_parent().get_child(3).play("BirdMouthOpen")


func _goodBreadToss():
	get_parent().get_child(3).stop()
	get_parent().get_child(3).play("BirdSwallow")
	$Blur.show()
	xVel = direction * 3.0

func _barelyBreadToss():
	get_parent().get_child(3).stop()
	get_parent().get_child(3).play("BirdSwallowMiss")
	$Blur.show()
	var b = preload("res://Scenes/Games/Bread.tscn").instantiate()
	get_parent().get_child(5).get_child(0).add_child(b)
	b.position = position + Vector2(10,-10)
	xVel = direction * 0.5
	
	

func _missedBreadToss():
	get_parent().get_child(3).stop()
	get_parent().get_child(3).play("BirdHeadBonk")
	$Blur.show()
	var b = preload("res://Scenes/Games/Bread.tscn").instantiate()
	get_parent().get_child(5).get_child(0).add_child(b)
	b.position = position + Vector2(10,-10)
	xVel *= -1.5

