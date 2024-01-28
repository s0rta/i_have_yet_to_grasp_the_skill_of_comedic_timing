extends AnimatedSprite2D

@onready var _rhythm_trigger = %RhythmTrigger
@onready var _animation_player = %AnimationPlayer
@onready var _scantron_bounce = %ScantronBounce
@onready var _conductor = %Conductor

# Called when the node enters the scene tree for the first time.
func _ready():
	_animation_player.play("basic_movement", -1, 0.5 / _conductor.sec_per_beat)
	_scantron_bounce.play("bounce", -1, 0.5 / _conductor.sec_per_beat)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("space"):
		_rhythm_trigger.frame = 1
	else:
		_rhythm_trigger.frame = 0

