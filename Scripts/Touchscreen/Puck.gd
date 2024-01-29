extends Sprite2D

var clicking : bool = false

var justClicked : bool = false

var justReleased : bool = false

var velocity : Vector2 = Vector2.ZERO

var canSlide : bool = true

var lastGlobalPos : Vector2 = Vector2.ZERO

var actionTypes = ["nothing","justPressed","justReleased","quickRelease","slide","flick","hold"]

var currentAction : String = ""

@export var quickTapLength : int = 2

var framesHeldButton : int = 0

@export var minSpeed : float = 0.0


var high : int = 0

signal input(input)

func _physics_process(delta):
	_touchScreen()
	
	_determineInput()
	



func _touchScreen():
	clicking = Input.is_action_pressed("Click")
	
	if Input.is_action_just_pressed("Click"):
		justClicked = true
		#position = Vector2(694,-606)
		
	elif Input.is_action_just_released("Click"):
		justReleased = true
	
	if clicking == true:
		
		#position += Input.get_vector("JoyLeft","JoyRight","JoyUp","JoyDown") * 15
		
		position = get_global_mouse_position() - get_parent().global_position
		
		framesHeldButton += 1
	elif clicking == false and !velocity == Vector2.ZERO:
		position += velocity
	
	
	
	
	if clicking == true:
		position.x = clamp(position.x,617,775)
		position.y = clamp(position.y,-715,-493)
	
	velocity = position - lastGlobalPos
	
	
	if clicking == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self,"scale",Vector2(0.065,0.065),0.05)
	else:
		var tween = get_tree().create_tween()
		if (abs(velocity.x) + abs(velocity.y)) / 2 > minSpeed:
			tween.tween_property(self,"scale",Vector2(0.0,0.0),0.8).set_trans(Tween.TRANS_LINEAR)
		else:
			velocity = Vector2(0,0)
			tween.tween_property(self,"scale",Vector2(0.0,0.0),0.3).set_trans(Tween.TRANS_LINEAR)
	
	lastGlobalPos = position
	

func _determineInput():
	currentAction = "nothing"
	
	#if abs(velocity.y) < 1:
	#	canSlide = true
	
	
	if clicking == true and abs(velocity.y) > 25 and canSlide == true:
		currentAction = actionTypes[4]
		#canSlide = false
	elif clicking == true and justClicked == false:
		currentAction = actionTypes[6]

	
	
	if justClicked == true:
		currentAction = actionTypes[1]
		justClicked = false
	
	
	if justReleased == true and framesHeldButton < quickTapLength:
		currentAction = actionTypes[3]
		justReleased = false
		framesHeldButton = 0
	elif justReleased == true and (abs(velocity.x) + abs(velocity.y)) / 2 > minSpeed:
		
		currentAction = actionTypes[5]
		justReleased = false
	elif justReleased == true:
		currentAction = actionTypes[2]
		justReleased = false
		framesHeldButton = 0
	
	
	emit_signal("input",currentAction)
	
	



