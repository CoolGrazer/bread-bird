extends StaticBody2D

var velY : float = -5.0
var velX : float = 0.0

var x : int = 0

var rotSpeed : float = 1.0

var spawnBeat : int = 0

var gravity = 1600

var curBeat : float = 0

func _ready():
	$Spawn.play()
	spawnBeat = GlobalValues.beatPos
	x = 0
	global_position.y = 46
	global_position.x = 96
	#velY = -2.5
	rotation_degrees = randf_range(-360,360)
	rotSpeed = randi_range(-2,2)
	
	if rotSpeed == 0:
		rotSpeed = -1

func _physics_process(delta):
	#print(velY)
	#position.y -= velY
	
	rotation_degrees += rotSpeed * 10.0
	
	position.y = round(position.y)
	position.y = 120
	_beat(GlobalValues.beatPos)


func _beat(beat):
	#if beat == curBeat + 0.25:
	#velY -= 0.8
	#	curBeat += 0.25
	
	print(spawnBeat + 1)
	print(beat)
	
	if beat == spawnBeat + 1:
		#print(position.y)
		position.y = 120
		gravity = 0
		velY = 0
		#print("hey")
		$Kick.play()
		spawnBeat = -9
		
	
