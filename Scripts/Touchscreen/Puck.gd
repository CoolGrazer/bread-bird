extends Sprite2D

var clicking : bool = false

var justClicked : bool = false

var justReleased : bool = false

var velocity : Vector2 = Vector2.ZERO

var lastGlobalPos : Vector2 = Vector2.ZERO

var actionTypes = ["nothing","justPressed","quickRelease","slide","flick"]

var currentAction : String = ""

@export var quickTapLength : int = 2

var framesHeldButton : int = 0

@export var minSpeed : float = 0.0

func _physics_process(delta):
	_touchScreen()
	
	#_determineInput()
	
	test()



func _touchScreen():
	clicking = Input.is_action_pressed("Click")
	
	if Input.is_action_just_pressed("Click"):
		justClicked = true
	
	if clicking == true:
		position = get_global_mouse_position() - get_parent().global_position
		framesHeldButton += 1
	elif clicking == false and !velocity == Vector2.ZERO:
		position += velocity
	
	
	print(get_global_mouse_position() - global_position)
	
	
	if clicking == true:
		position.x = clamp(position.x,617,775)
		position.y = clamp(position.y,-715,-493)
	
	velocity = position - lastGlobalPos
	
	
	if clicking == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self,"scale",Vector2(0.065,0.065),0.05)
	else:
		var tween = get_tree().create_tween()
		if velocity > Vector2(minSpeed,minSpeed):
			tween.tween_property(self,"scale",Vector2(0.0,0.0),0.2)
		else:
			tween.tween_property(self,"scale",Vector2(0.0,0.0),0.3)
	
	lastGlobalPos = position

func _determineInput():
	currentAction = "nothing"
	
	
	if justClicked == true:
		currentAction = actionTypes[1]
		justClicked = false
	
	
	
	


func test():
	
	
	if currentAction == "quickTap":
		$TestSound/Pah.play()
	
	if currentAction == "hold" and $TestSound/Doo.playing == false:
		$TestSound/Doo.play()
	elif currentAction == "justReleased" and $TestSound/Wop.playing == false:
		$TestSound/Wop.play()
	elif currentAction == "nothing":
		$TestSound/Doo.stop()


