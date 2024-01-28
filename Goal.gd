extends Node

class_name Goal

var key_sequence: Array

func _init(key_sequence):
	print("in init", key_sequence)
	key_sequence = key_sequence

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
