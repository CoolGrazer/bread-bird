extends Node

var beatTrgt : float = 2.0

var offBeat : float = 0.0

var status = ""

# Possible Status, EarlyMiss, EarlyBarely, Perfect, LateBarely, LateMiss

func _physics_process(delta):
	
	if offBeat < -0.5:
		status = "EarlyMiss"
	elif offBeat < -0.4:
		status = "EarlyBarely"
	elif offBeat < 0.4:
		status = "Perfect"
	elif offBeat > 0.4:
		status = "LateBarely"
	elif offBeat > 0.5:
		status = "LateMiss"
	
	
	_calculateOffBeat()


func _calculateOffBeat():
	offBeat = GlobalValues.trueBeat - beatTrgt
	
	
	
func _fadeOut():
	
	$Flick.volume_db -= 3


func _on_puck_input(input):
	print($Release.playing)
	if $Coin.frame == 12:
		$Release.play()
		
	
	if $Coin.frame > 12:
		_fadeOut()
	
	if $Coin.frame > 7 and $Coin.frame < 12:
		$Flick.pitch_scale -= 0.01
	
	
	if input == "flick":
		$Flick.pitch_scale = 1
		$AnimationPlayer.stop()
		$AnimationPlayer.play("Flick")
		$Flick.play()
		$Flick.volume_db = 0
		$CoinCatch.play()
	
	#if input == "slide" and $Flick.playing == false:
	#		
	
	if input == "justPressed" and $Flick.playing == false:
		$AnimationPlayer.play("PressDown")
		$Press.play()
		
	elif input == "justReleased":
		$AnimationPlayer.play("Release")
		$Release.play()
		$Release.pitch_scale = 1
		$Flick.stop()
	elif input == "quickRelease":
		$AnimationPlayer.play("Release")
		$Release.pitch_scale = 2.5
		$Release.play()
		$Flick.stop()
