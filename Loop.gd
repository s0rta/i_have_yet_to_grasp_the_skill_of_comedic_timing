extends Node

@onready var conductor = get_node("Conductor")
@onready var judge = get_node("Judge")

func _input(event):
	print(event.keycode)
	if event is InputEventKey and event.keycode == 32:
		judge.score_input(event)
		# TODO CWS: debounce this

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
