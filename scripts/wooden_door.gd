extends Node2D

var mouse_on = false
var can_be_open = false
@onready var animated_sprite = $AnimatedSprite2D
var is_open = false
@onready var marker = $Marker

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var go_in_cursor = preload("res://assets/cursors/enter_door_cursor.png")

func _on_area_2d_mouse_entered():
	mouse_on = true
	if !is_open:
		Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
	else:
		Input.set_custom_mouse_cursor(go_in_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func _on_area_2d_mouse_exited():
	mouse_on = false
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.key_selected.connect(func():
		can_be_open = true
		)
		
	Events.key_not_selected.connect(func():
		can_be_open = false
		)
	Events.key_used.connect(func():
		can_be_open = false
		)

func _process(delta):
	if Input.is_action_just_pressed("mouse_click") and is_open and mouse_on:
		Events.teleport_position.emit(marker.global_position)
	
	
	if Input.is_action_just_pressed("mouse_click") and can_be_open and !is_open and mouse_on:
		Input.set_custom_mouse_cursor(go_in_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
		is_open = true
		animated_sprite.play("open")
		Events.key_used.emit()
		

		
