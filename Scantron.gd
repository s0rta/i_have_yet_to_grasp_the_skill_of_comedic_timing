extends AnimatedSprite2D

@onready var _scantron = %Scantron

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_scanton_display(score):
	if (score == Judge.Score.PERFECT):
		_scantron.frame = 2
	if (score == Judge.Score.GOOD):
		_scantron.frame = 0
	if (score == Judge.Score.OK):
		_scantron.frame = 0
	if (score == Judge.Score.MISS):
		_scantron.frame = 1
