extends Node

@onready var judge = %Judge

func _input(event):
	print(event.as_text())
	if event is InputEventKey and event.keycode == 32:
		var score = judge.score_input(event)
		%ScoreBoard.set_score_display(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
