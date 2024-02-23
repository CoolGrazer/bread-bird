extends Node

var beatTrgt : float = 4.0

var offBeat : float = 0.0

var status = "Perfect"

# Possible Status, EarlyMiss, EarlyBarely, Perfect, LateBarely, LateMiss

func _physics_process(delta):
	
	if $Coin.frame == 9 and $CoinCatch.playing == false:
		
		$CoinCatch.play()
	
	
	#if offBeat < -0.5:
	#	status = "EarlyMiss"
	#elif offBeat < -0.4:
	#	status = "EarlyBarely"
	#elif offBeat < 0.4:
	#	status = "Perfect"
	#elif offBeat > 0.4:
	#	status = "LateBarely"
	#elif offBeat > 0.5:
	#	status = "LateMiss"
	
	if abs(offBeat) < 0.3:
		status = "Perfect"
	elif abs(offBeat) < 0.4:
		status = "Barely"
	else:
		status = "Bad."
	
	
	
	
	
	_calculateOffBeat()


func _calculateOffBeat():
	offBeat = GlobalValues.trueBeat - beatTrgt
	
	
	


func _on_puck_input(input):
	
	
	if get_parent().get_child(4).indx < 14:
		status = "Perfect"
	
	
	if input == "flick" and status == "Perfect":
		
		$AnimationPlayer.stop()
		$Flick.pitch_scale = 1.0
		$AnimationPlayer.play("Flick")
		$Flick.play()
	elif input == "flick":
		$AnimationPlayer.play("BadFlick")
		$Flick.pitch_scale = 0.75
		$Flick.play()
	
	#if input == "slide" and $Flick.playing == false:
	#		
	
	if input == "justPressed" and !$AnimationPlayer.current_animation == "Flick":
		$AnimationPlayer.stop()
		$AnimationPlayer.play("PressDown")
		$Press.play()
		
	elif input == "justReleased" and !$AnimationPlayer.current_animation == "Flick":
		$AnimationPlayer.play("Release")
		$Release.play()
		$Release.pitch_scale = 1
	elif input == "quickRelease":
		$AnimationPlayer.play("Release")
		$Release.pitch_scale = 2.5
		$Release.play()


func _fakeHold():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("PressDown")
	$Press.play()

func _fakeFlick():
	print("are you runnign")
	$AnimationPlayer.stop()
	$AnimationPlayer.play("Flick")
	$Flick.play()


func _on_tutorial_beat(beat):
	pass
