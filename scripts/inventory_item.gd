extends Panel


var item: Node2D = null
var mouse_on = false
@onready var inventory_item = $"."
@onready var sprite = $Sprite2D

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")


func _on_mouse_entered():
	mouse_on = true
	Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func _on_mouse_exited():
	mouse_on = false
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))

func _process(delta):
	if Input.is_action_just_pressed("left_mouse") and mouse_on:
		Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7)) # reset cursor to normal
		Events.item_selected.emit(self)
