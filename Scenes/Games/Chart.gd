extends Node

var breadPrep = [0,2,4]
var breadTosses = [1,3,5]

var finalThrow = [20,30]

var indx : int = 0
var indx2 : int = 0

signal breadToss


func _on_audio_stream_player_beat(beat):
	if indx < breadTosses.size() and beat == breadPrep[indx]:
		emit_signal("breadToss")
		indx += 1
	
	
	
