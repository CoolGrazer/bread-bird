extends Node

var breadPrep = [[16, "breadPrep"], [18, "breadPrep"], [20, "breadPrep"], [22, "breadPrep"], [24, "breadPrep"], [26, "breadPrep"], [28, "breadPrep"], [30, "breadPrep"], [32, "breadPrep"], [33.5, "breadPrep"], [35, "breadPrep"], [36.5, "breadPrep"], [38, "breadPrep"], [40, "breadPrep"], [41.5, "breadPrep"], [43, "breadPrep"], [44.5, "breadPrep"], [46, "breadPrep"], [48, "breadPrep"], [50, "breadPrep"], [52, "breadPrep"], [54, "breadPrep"], [56, "breadPrep"], [58, "breadPrep"], [60, "breadPrep"], [62, "breadPrep"], [64, "breadPrep"], [65.5, "breadPrep"], [67, "breadPrep"], [68.5, "breadPrep"], [70, "breadPrep"], [72, "breadPrep"], [73.5, "breadPrep"], [75, "breadPrep"], [76.5, "breadPrep"], [78, "breadPrep"], [80, "breadPrep"], [82, "breadPrep"], [84, "breadPrep"], [86, "breadPrep"], [88, "breadPrep"], [90, "breadPrep"], [92, "breadPrep"], [94, "breadPrep"], [96, "breadPrep"], [97.5, "breadPrep"], [99, "breadPrep"], [100.5, "breadPrep"], [102, "breadPrep"], [104, "breadPrep"], [105.5, "breadPrep"], [107, "breadPrep"], [108.5, "breadPrep"], [110, "breadPrep"], [112, "breadPrep"], [114, "breadPrep"], [116, "breadPrep"], [118, "breadPrep"], [120, "breadPrep"], [122, "breadPrep"], [124, "breadPrep"], [127, "breadPrep"]]
var breadTosses = [[17, "breadCatch"], [19, "breadCatch"], [21, "breadCatch"], [23, "breadCatch"], [25, "breadCatch"], [27, "breadCatch"], [29, "breadCatch"], [31, "breadCatch"], [33, "breadCatch"], [34.5, "breadCatch"], [36, "breadCatch"], [37.5, "breadCatch"], [39, "breadCatch"], [41, "breadCatch"], [42.5, "breadCatch"], [44, "breadCatch"], [45.5, "breadCatch"], [47, "breadCatch"], [49, "breadCatch"], [51, "breadCatch"], [53, "breadCatch"], [55, "breadCatch"], [57, "breadCatch"], [59, "breadCatch"], [61, "breadCatch"], [63, "breadCatch"], [65, "breadCatch"], [66.5, "breadCatch"], [68, "breadCatch"], [69.5, "breadCatch"], [71, "breadCatch"], [73, "breadCatch"], [74.5, "breadCatch"], [76, "breadCatch"], [77.5, "breadCatch"], [79, "breadCatch"], [81, "breadCatch"], [83, "breadCatch"], [85, "breadCatch"], [87, "breadCatch"], [89, "breadCatch"], [91, "breadCatch"], [93, "breadCatch"], [95, "breadCatch"], [97, "breadCatch"], [98.5, "breadCatch"], [100, "breadCatch"], [101.5, "breadCatch"], [103, "breadCatch"], [105, "breadCatch"], [106.5, "breadCatch"], [108, "breadCatch"], [109.5, "breadCatch"], [111, "breadCatch"], [113, "breadCatch"], [115, "breadCatch"], [117, "breadCatch"], [119, "breadCatch"], [121, "breadCatch"], [123, "breadCatch"], [125, "breadCatch"], [128, "breadCatch"]]

var finalThrow = [20,30]

var indx : int = 0
var indx2 : int = 0

signal breadToss
signal breadCatch




func _on_audio_stream_player_beat(beat):
	
	if indx < breadPrep.size() and beat == breadPrep[indx][0]:
		emit_signal("breadToss")
		indx += 1
	
	
	if indx2 < breadTosses.size() and beat == breadTosses[indx2][0]:
		emit_signal("breadCatch")
		indx2 += 1
