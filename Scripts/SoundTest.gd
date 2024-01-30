extends Node

var high = 0


func _on_puck_input(input):
	print(input)
	if Input.is_action_just_pressed("Debug"):
		high = 1
	
	if input == "justPressed":
		print(high)
		if high == 0:
			$Kick.play()
		
		
		if high == 1:
			$High.play()
			high = 2
		elif high == 2:
			$HighKick.play()
			high = 3
	
	if input == "flick" and high == 3:
		$Toe.play()
		high = 0
	
	

