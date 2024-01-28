extends Node

class_name GoalManager

@onready var conductor = %Conductor

var possible_keys: Dictionary
var _current_goal: Goal

func _init():
	possible_keys = {}

func get_current_goal():
	if not _current_goal or _current_goal.key_sequence.is_empty():
		_current_goal = generate_goal()
	
	var goal = _current_goal
	
	# if we're on the last beat of the measure, generate a new current_goal
	if conductor.closest_beat()[0] == 4:
		_current_goal = generate_goal()
	
	return goal

func generate_goal() -> Goal:
	if possible_keys.is_empty():
		return _default_goal()
	else:
		var possible_keys_array = possible_keys.keys()
		return Goal.new([null, possible_keys_array.pick_random(), null, possible_keys_array.pick_random()])
	
func _default_goal():
	return Goal.new([null, KEY_SPACE, null, KEY_SPACE])

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
