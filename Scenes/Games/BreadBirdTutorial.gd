extends Node2D

var timesLeft = 3




func _physics_process(delta):
	if timesLeft == 0 and $Textbox.indx == 4:
		$Textbox._text($Textbox.TextDoTo[$Textbox.indx],$Textbox.SizeToDo[$Textbox.indx],$Textbox.Enable[$Textbox.indx])
		$Textbox.indx += 1
	
	if $Textbox.indx == 10 and timesLeft == 0:
		timesLeft = 4
		$Fading.play("FadeIn")
	
	
	print($Textbox.indx)
	
	if $Textbox.indx == 8:
		$Sound2/Catch.play()
		$Textbox._text($Textbox.TextDoTo[$Textbox.indx],$Textbox.SizeToDo[$Textbox.indx],$Textbox.Enable[$Textbox.indx])
		$Textbox.indx += 1
	
	
	
	
	
	if $Textbox.indx == 10 and $Fading.current_animation == "":
		get_tree().change_scene_to_file("res://Scenes/Games/BreadBird.tscn")


func _on_puck_input(input):
	
	if $Textbox.indx == 4 and input == "justPressed":
		timesLeft -= 1
