extends Node

class_name Judge

@onready var conductor = %Conductor
# Measures how easy this judge is going to be on the player, on a scale of 0-1, with higher being easier 
var permissiveness = 0.80
var last_beat_for_input_received = 0

enum Score {
	PERFECT,
	GOOD,
	OK,
	MISS,
	NA
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func score_input(input, current_goal: Goal):
	var closest_beat_tuple = conductor.closest_beat()
	var closest_beat = closest_beat_tuple[0]
	var time_off_beat = closest_beat_tuple[1]
	
	if closest_beat == last_beat_for_input_received:
		return
	
	last_beat_for_input_received = closest_beat
	
	var target_keycode = current_goal.key_sequence[closest_beat - 1]
	
	if not target_keycode:
		return Score.NA
	elif input.keycode != target_keycode:
		return Score.MISS
	
	return _score_time(time_off_beat)
	
func _score_time(time_off_beat) -> Score:
	var percent_off = time_off_beat / conductor.sec_per_beat
	var weighted_percent_off = pow(percent_off, permissiveness)
	if weighted_percent_off < 0.1:
		return Score.PERFECT
	elif weighted_percent_off < 0.2:
		return Score.GOOD
	elif  weighted_percent_off < 0.5:
		return Score.OK
	else:
		return Score.MISS
	
	
