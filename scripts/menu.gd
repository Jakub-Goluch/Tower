extends Control

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
@onready var menu_music: AudioStreamPlayer2D = $MenuMusic


func _ready():
	$VBoxContainer/StartButton.connect("pressed", start_game)
	$VBoxContainer/QuitButton.connect("pressed", quit_game)
	
	$VBoxContainer/StartButton.connect("mouse_entered", change_cursor)
	$VBoxContainer/StartButton.connect("mouse_exited", reset_cursor)
	
	$VBoxContainer/QuitButton.connect("mouse_entered", change_cursor)
	$VBoxContainer/QuitButton.connect("mouse_exited", reset_cursor)
	menu_music.play()

func start_game():
	menu_music.stop()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
func quit_game():
	menu_music.stop()
	get_tree().quit()
	
func change_cursor():
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

	
func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
