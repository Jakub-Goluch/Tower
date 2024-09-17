extends Panel


var item: Node2D = null
var mouse_on = false
@onready var inventory_item = $"."
@onready var sprite = $Sprite2D

func _on_mouse_entered():
	mouse_on = true

func _on_mouse_exited():
	mouse_on = false

func _process(delta):
	if Input.is_action_just_pressed("left_mouse") and mouse_on:
		print(inventory_item.name)
		Events.item_selected.emit(self)
