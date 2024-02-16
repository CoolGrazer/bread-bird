extends Node

var beatTrgt : float = 0.0

var offBeat : float = 0.0

var status = "Perfect"

# Possible Status, EarlyMiss, EarlyBarely, Perfect, LateBarely, LateMiss

func _physics_process(delta):
	
	if $Coin.frame == 8 and $CoinCatch.playing == false:
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
	
	if abs(offBeat) < 0.4:
		status = "Perfect"
	elif abs(offBeat) < 0.6:
		status = "Barely"
	else:
		status = "Bad."
	
	if offBeat > 1:
		beatTrgt = 12
	
	_calculateOffBeat()


func _calculateOffBeat():
	offBeat = GlobalValues.trueBeat - beatTrgt
	
	
	


func _on_puck_input(input):
	
	
	
	
	
	if input == "flick" and status == "Perfect":
		
		$AnimationPlayer.stop()
		$AnimationPlayer.play("Flick")
		$Flick.play()
	elif input == "flick":
		get_tree().quit()
	
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
	$AnimationPlayer.stop()
	$AnimationPlayer.play("Flick")
	$Flick.play()


func _on_tutorial_beat(beat):
	print("The Beat has Occured")
