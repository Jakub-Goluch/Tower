extends Node2D

var mouse_on = false
@onready var animated_sprite = $AnimatedSprite2D
@onready var marker = $Marker


func _on_area_2d_mouse_entered():
	mouse_on = true


func _on_area_2d_mouse_exited():
	mouse_on = false

func _process(delta):
	if Input.is_action_just_pressed("mouse_click") and mouse_on:
		Events.teleport_position.emit(marker.global_position)
	
