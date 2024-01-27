extends AnimatedSprite2D

@onready var _score_board = %ScoreBoard

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_score_display(score):
	if (score == Judge.Score.PERFECT):
		_score_board.frame = 0
	if (score == Judge.Score.GOOD):
		_score_board.frame = 1
	if (score == Judge.Score.OK):
		_score_board.frame = 2
	if (score == Judge.Score.MISS):
		_score_board.frame = 3
