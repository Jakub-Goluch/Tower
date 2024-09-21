extends Node

var left = false
var right = false
var anim_played = false # flag
var count = 0
@onready var flag_key: Node2D = $FlagKey
@onready var main_music: AudioStreamPlayer2D = %MainMusic

func _ready():
	$FlagsLeft/HBoxContainer.connect("left_solved", mark_left)
	$FlagsRight/HBoxContainer.connect("right_solved", mark_right)
	$FlagKey.visible = false
	
func _process(delta):
	if !anim_played && count == 0:
		if left && right:
			count += 1
			anim_played = false
			win()
	
func mark_left():
	left = true
	print("left good")
	
func mark_right():
	right = true
	print("right good")

func win():
	$FlagKey.visible = true
	$KingStatue.play("spin")
	$KnightStatue.play("spin")
	if !$FlagSolvedAudio.playing:
		$FlagSolvedAudio.play()
		main_music.volume_db -= 5
	await get_tree().create_timer(8.0).timeout
	#$KingStatue.stop()
	#$KnightStatue.stop()
	$FlagSolvedAudio.stop()
	main_music.volume_db += 5
