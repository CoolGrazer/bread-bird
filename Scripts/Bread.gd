extends StaticBody2D

var velY : float = -5.0
var velX : float = 0.0

var x : int = 0

var rotSpeed : float = 1.0

var spawnBeat : int = 0

func _ready():
	$Spawn.play()
	spawnBeat = GlobalValues.beatPos
	x = 0
	global_position.y = -124
	velY = -2.5
	rotation_degrees = randf_range(-360,360)
	rotSpeed = randi_range(-2,2)
	if rotSpeed == 0:
		rotSpeed = -1

func _physics_process(delta):
	
	position.y += velY
	velY += 0.22 * 2
	rotation_degrees += 5 * rotSpeed
	
	position.x += velX
	
	position.x = snapped(position.x,1)
	position.y = snapped(position.y,1)
	
	# Repsawning this bread leads to reseting of pos
	
	#print(x)
	
	


func _on_audio_stream_player_beat(beat):
	
	
	
	if position == Vector2(96,116):
		print(beat)
	
	if beat == spawnBeat + 1:
		
		print(position)
		velY = -5.0
		velX = RandomNumberGenerator.new().randf_range(-5,5)
		$Kick.play()
		
		spawnBeat = beat
		x = 0
		velX = 0
		global_position.y = -124
		velY = -2.5
		rotation_degrees = randf_range(-360,360)
		rotSpeed = randi_range(-2,2)
		if rotSpeed == 0:
			rotSpeed = -1
	
	#if fmod(beat,1) == 0:
	#	print(position)
