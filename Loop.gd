extends Node

@onready var judge = %Judge
@onready var goal_manager = %GoalManager

func _input(event):
	if event is InputEventKey:
		var current_goal = goal_manager.get_current_goal()
		var score = judge.score_input(event, current_goal)
		%ScoreBoard.set_score_display(score)
		%Scantron.set_scanton_display(score)
		%Blorgo.set_blorgo_display(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	
	# TODO CWS: display current goal here?
