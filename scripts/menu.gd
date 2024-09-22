extends Control

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")


func _ready():
	AudioPlayer.play_menu_music()
	$VBoxContainer/StartButton.connect("pressed", start_game)
	$VBoxContainer/QuitButton.connect("pressed", quit_game)
	$VBoxContainer/OptionsButton.connect("pressed", open_options)
	
	$VBoxContainer/StartButton.connect("mouse_entered", change_cursor)
	$VBoxContainer/StartButton.connect("mouse_exited", reset_cursor)
	
	$VBoxContainer/QuitButton.connect("mouse_entered", change_cursor)
	$VBoxContainer/QuitButton.connect("mouse_exited", reset_cursor)

	$VBoxContainer/OptionsButton.connect("mouse_entered", change_cursor)
	$VBoxContainer/OptionsButton.connect("mouse_exited", reset_cursor)

func start_game():
	AudioPlayer.stop_menu_music()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func quit_game():
	AudioPlayer.stop_menu_music()
	get_tree().quit()
	
func change_cursor():
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
	
func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func open_options():
	get_tree().change_scene_to_file("res://scenes/options.tscn")
