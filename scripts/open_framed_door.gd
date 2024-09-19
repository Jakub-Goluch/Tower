extends Node2D

var mouse_on = false
@onready var animated_sprite = $Sprite2D
@onready var marker = $Marker
@onready var player: CharacterBody2D = %Player
@onready var camera_marker: Marker2D = $CameraMarker
@onready var camera: Camera2D = %Camera2D
@onready var animated_sprite_player: AnimatedSprite2D = %Player/AnimatedSprite2D


var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var go_in_cursor = preload("res://assets/cursors/enter_door_cursor.png")


func _on_area_2d_mouse_entered():
	mouse_on = true
	Input.set_custom_mouse_cursor(go_in_cursor, Input.CURSOR_ARROW, Vector2(6, 7))


func _on_area_2d_mouse_exited():
	mouse_on = false
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))

func _process(delta):
	if Input.is_action_just_pressed("mouse_click") and mouse_on:
		# play enter door animation
		player.position = self.position
		player.position.y += 7
		animated_sprite_player.play("enter_door")
		for i in range(0, 6):
			animated_sprite_player.scale -= Vector2(0.1, 0.1)
			await get_tree().create_timer(0.1).timeout
		 
		
		Events.teleport_position.emit(marker.global_position)
		## test for separate camera teleportation
		camera.position = camera_marker.global_position
		## test code for player teleportation
		player.position = marker.global_position
		
		# play exit door animation
		animated_sprite_player.play("exit_door")
		for i in range(0, 6):
			animated_sprite_player.scale += Vector2(0.1, 0.1)
			await get_tree().create_timer(0.1).timeout
		 
