extends AudioStreamPlayer2D

@export var bpm := 120
@export var measures := 4
@export var beats_before_start := 0

# tracking the beat and song pos
var song_position = 0.0
var song_position_in_beats = 1
var sec_per_beat = 60.0 / bpm
var last_reported_beat = 0

var measure = 1

# determining how close to the beat user input is
var closest = 0
var time_off_beat = 0

signal sig_beat(position)
signal sig_measure(position)

# Called when the node enters the scene tree for the first time.
func _ready():
	sec_per_beat = 60.0 / bpm
	play_from_beat(0, 0)

func _physics_process(_delta):
	if playing:
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_position_in_beats = int(floor(song_position / sec_per_beat)) + beats_before_start
		_report_beat()

func _report_beat():
	if last_reported_beat < song_position_in_beats:
		if measure > measures:
			measure = 1
		emit_signal("sig_beat", song_position_in_beats)
		emit_signal("sig_measure", measure)
		last_reported_beat = song_position_in_beats
		measure += 1

func play_with_beat_offset(n):
	beats_before_start = n
	$StartTimer.wait_time = sec_per_beat
	$StartTimer.start()

func closest_beat(nth):
	closest = int(round((song_position / sec_per_beat) / nth) * nth)
	time_off_beat = abs(closest * sec_per_beat - song_position)
	return Vector2(closest, time_off_beat)
	
func get_time_off_beat():
	var closest_beat = closest_beat(song_position_in_beats)
	return closest_beat[1]

func play_from_beat(beat, offset):
	play()
	seek(beat * sec_per_beat)
	beats_before_start = offset
	
	measure = beat % measures
	
func _on_StartTimer_timeout():
	song_position_in_beats += 1
	if song_position_in_beats < beats_before_start - 1:
		$StartTimer.start()
	elif song_position_in_beats == beats_before_start - 1:
		$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() + 
														AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	_report_beat()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
