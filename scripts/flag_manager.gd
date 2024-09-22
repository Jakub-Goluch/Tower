extends Node

var left = false
var right = false
var anim_played = false # flag
var count = 0
@onready var flag_key: Node2D = $FlagKey
@onready var main_music: AudioStreamPlayer2D = %MainMusic

func _ready():
	#$FlagsLeft/HBoxContainer.connect("left_solved", mark_left)
	#$FlagsRight/HBoxContainer.connect("right_solved", mark_right)
	$FlagKey.visible = false
	
	# connect right flag signals to check in left
	$"FlagsRight/HBoxContainer/5/TextureButton".connect("flags_changed", $FlagsLeft/HBoxContainer.check_order)
	$"FlagsRight/HBoxContainer/6/TextureButton".connect("flags_changed", $FlagsLeft/HBoxContainer.check_order)
	$"FlagsRight/HBoxContainer/7/TextureButton".connect("flags_changed", $FlagsLeft/HBoxContainer.check_order)
	$"FlagsRight/HBoxContainer/8/TextureButton".connect("flags_changed", $FlagsLeft/HBoxContainer.check_order)

	$"FlagsLeft/HBoxContainer/1/TextureButton".connect("flags_changed", $FlagsRight/HBoxContainer.check_order)
	$"FlagsLeft/HBoxContainer/2/TextureButton".connect("flags_changed", $FlagsRight/HBoxContainer.check_order)
	$"FlagsLeft/HBoxContainer/3/TextureButton".connect("flags_changed", $FlagsRight/HBoxContainer.check_order)
	$"FlagsLeft/HBoxContainer/4/TextureButton".connect("flags_changed", $FlagsRight/HBoxContainer.check_order)

	
func _process(delta):
	if !anim_played && count == 0:
		#if left && right:
		if $FlagsLeft/HBoxContainer.flags_solved && $FlagsRight/HBoxContainer.flags_solved:
			count += 1
			anim_played = true
			win()
	
#func mark_left():
	#left = true
	#print("left good")
	#
#func mark_right():
	#right = true
	#print("right good")

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
