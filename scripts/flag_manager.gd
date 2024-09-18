extends Node

var left = false
var right = false
var anim_played = false # flag
var count = 0

func _ready():
	$FlagsLeft/HBoxContainer.connect("left_solved", mark_left)
	$FlagsRight/HBoxContainer.connect("right_solved", mark_right)
	
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
	$KingStatue.play("spin")
	$KnightStatue.play("spin")
	if !$FlagSolvedAudio.playing:
		$FlagSolvedAudio.play()
	await get_tree().create_timer(8.0).timeout
	#$KingStatue.stop()
	#$KnightStatue.stop()
	$FlagSolvedAudio.stop()
