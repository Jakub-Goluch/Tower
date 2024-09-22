extends Control

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")


func _ready():
	AudioPlayer.play_menu_music()
	$Button.connect("pressed", open_menu)
	
	$Button.connect("mouse_entered", change_cursor)
	$Button.connect("mouse_exited", reset_cursor)

	
func open_menu():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func change_cursor():
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
