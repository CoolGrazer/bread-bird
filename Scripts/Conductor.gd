extends AudioStreamPlayer

@export var bpm : float = 120
var measures := 60

@export var msOffset : float = 0.0


#Tracking the beat and song position
var song_position = 0.0
var song_position_in_beats : float = 0
var sec_per_beat = 60.0 / bpm
var last_reported_beat = -1
var beats_before_start = 0
var measured = 0



signal beat(position)
signal measure(position)
signal songPos(position)
signal secBeat(position)

var timeBetweenHits : float = 0.0



func _ready():
	GlobalValues.bpm = bpm
	sec_per_beat = 60.0 / bpm
	GlobalValues.secPerBeat = sec_per_beat
	GlobalValues.beatsBStart = beats_before_start
	emit_signal("secBeat",sec_per_beat)
	seek(msOffset / 1000)
	

func _physics_process(delta):
	
	sec_per_beat = 60.0 / bpm
	if playing:
		GlobalValues.isPlaying = true
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		
		song_position_in_beats = _floorto((song_position / sec_per_beat),0.25) + beats_before_start
		
		_report_beat()
		emit_signal("songPos",song_position)
		GlobalValues.positionofSong = song_position

func _report_beat():
	if last_reported_beat < song_position_in_beats:
		timeBetweenHits = 0
		last_reported_beat = song_position_in_beats
		
		
		emit_signal("beat",song_position_in_beats)
		
		#print(song_position_in_beats)
		
		
	else:
		timeBetweenHits += 1
		

func restart():
	song_position = 0.0
	song_position_in_beats = 0
	sec_per_beat = 60.0 / bpm
	last_reported_beat = -1
	beats_before_start = 0
	measured = 0



func _on_control_play():
	play()

func play_from_beat(beat):
	play()
	seek(beat * sec_per_beat)



func _floorto(val,snap):
	
	if snapped(val,snap) > val:
		val = snapped(val,snap) - snap
	else:
		val = snapped(val,snap)
	
	return val

