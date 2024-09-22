extends Control


func _ready():
	AudioPlayer.play_menu_music()
	$Button.connect("pressed", open_menu)
	
	
func open_menu():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
