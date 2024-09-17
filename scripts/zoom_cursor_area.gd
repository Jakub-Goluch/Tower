extends Area2D

signal change_to_zoom
signal change_to_normal

var in_area = false

func _ready():
	connect("mouse_entered", mouse_in)
	connect("mouse_exited", mouse_out)
	
func mouse_in():
	emit_signal("change_to_zoom")
	in_area = true

func mouse_out():
	emit_signal("change_to_normal")
	in_area = false
