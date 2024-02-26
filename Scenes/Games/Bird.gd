extends Sprite2D

var xVel : float = 0.0


var animsPlaying : bool = false


var direction : int = 1

# Make the bird swim in random directions with an impulse based force


# Create necessary events in order to spawn bread

# Add input detection

# Add music..





func _physics_process(delta):
	
	get_parent().get_child(3).speed_scale = GlobalValues.bpm / 120
	
	#if $Blur.visible == true:
	#	$Blur.hide()
	#else:
	#	$Blur.show()
	
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
	
	
	
	print(GlobalValues.score)
	
	position.x += xVel
	
	xVel *= 0.95


func _on_audio_stream_player_beat(beat):
	
	
	
	if fmod(beat,2) == 0:
		
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
	elif fmod(beat,1) == 0:
		if animsPlaying == false:
			frame = 1


func _mouthOpen():
	get_parent().get_child(3).play("BirdMouthOpen")


func _goodBreadToss():
	get_parent().get_child(3).stop()
	get_parent().get_child(3).play("BirdSwallow")
	$Blur.show()
	$Swallow.play()

func _barelyBreadToss():
	get_parent().get_child(3).stop()
	get_parent().get_child(3).play("BirdSwallowMiss")
	$Blur.show()
	var b = preload("res://Scenes/Games/Bread.tscn").instantiate()
	get_parent().get_child(5).get_child(0).add_child(b)
	b.position = position + Vector2(10,-10)
	xVel = direction * 0.5
	$Barely.play()
	
	

func _missedBreadToss():
	get_parent().get_child(3).stop()
	get_parent().get_child(3).play("BirdHeadBonk")
	$Blur.show()
	var b = preload("res://Scenes/Games/Bread.tscn").instantiate()
	get_parent().get_child(5).get_child(0).add_child(b)
	b.position = position + Vector2(10,-10)
	xVel *= -1.5
	$Miss.play()



#func _on_chart_bread_toss():
#	_mouthOpen()


#func _on_chart_bread_catch():
#	_barelyBreadToss()


func _on_input_status_emit(status):
	if status == "Perfect":
		GlobalValues.score += 1.2
		_goodBreadToss()
	elif status == "Barely":
		_barelyBreadToss()
		GlobalValues.score += 0.0
	else:
		_missedBreadToss()
		GlobalValues.score += 0.0


func _on_puck_input(input):
	if input == "justPressed":
		_mouthOpen()
	
