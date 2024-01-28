extends AnimatedSprite2D

@onready var _blorgo = %Blorgo

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_blorgo_display(score):
	if (score == Judge.Score.PERFECT):
		_blorgo.frame = 2
	if (score == Judge.Score.GOOD):
		_blorgo.frame = 0
	if (score == Judge.Score.OK):
		_blorgo.frame = 0
	if (score == Judge.Score.MISS):
		_blorgo.frame = 1
