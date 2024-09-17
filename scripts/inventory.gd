extends HBoxContainer

@onready var inventory = $"."
var selected_item = null


func remove_sprite(name: String) -> void:
	for child in inventory.get_children():
		if child.name == name:
			child.item = null
			child.get_child(0).texture = null
			selected_item.get_node("whiteground").visible = false
			selected_item = null

func add_sprite(item: Node2D) -> void:
	for child in inventory.get_children():
		if child.get_child(0).texture == null:
			child.item = item
			child.get_child(0).texture = item.get_child(0).texture
			break 

func _ready() -> void:
	Events.item_selected.connect(func(item):
		if selected_item != null:
			selected_item.get_node("whiteground").visible = false
		selected_item = item
		item.get_node("whiteground").visible = true
		)
	Events.item_picked.connect(func(item):
		add_sprite(item)
		)


func _process(delta):
	if Input.is_action_just_pressed("up"):
		print("dupa")
		if selected_item == null:
			pass
		else:
			remove_sprite(selected_item.name)
