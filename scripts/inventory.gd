extends HBoxContainer

@onready var inventory = $"."
var selected_item = null
var delete_key = false
var has_a_key = false
var key_selected = false
var vase_selected = false
var skeleton_selected = false
@onready var pick_up_sound: AudioStreamPlayer2D = $PickUpSound


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
			
			pick_up_sound.play()
			
			child.item = item
			child.get_child(0).texture = item.get_child(0).texture
			if child.get_child(0).texture.resource_path != "res://assets/pickup_items/key_gold.png":
				if child.get_child(0).texture.resource_path != "res://assets/pickup_items/trup3.png":
					child.get_child(0).position = Vector2(4,2)
				else:
					child.get_child(0).position += Vector2(2,2)
			else:
				child.get_child(0).position = Vector2(1,-2)
			break 

func _ready() -> void:
	Events.item_selected.connect(func(item):
		if selected_item != null:
			selected_item.get_node("whiteground").visible = false
		selected_item = item
		item.get_node("whiteground").visible = true
		var texture = selected_item.get_child(0).texture
		if texture != null:
			if texture.resource_path == "res://assets/pickup_items/key_gold.png":
				key_selected = true
			else:
				key_selected = false
			if texture.resource_path == "res://assets/pickup_items/vase2.png" || texture.resource_path == "res://assets/pickup_items/vase3.png"  || texture.resource_path == "res://assets/pickup_items/vase4.png" || texture.resource_path == "res://assets/pickup_items/vase5.png":
				vase_selected = true
			else:
				vase_selected = false
			if texture.resource_path == "res://assets/pickup_items/trup3.png" || texture.resource_path == "res://assets/pickup_items/trup6.png":
				skeleton_selected = true
			else:
				skeleton_selected = false
		else:
			key_selected = false
			vase_selected = false
			skeleton_selected = false
		)
	Events.item_picked.connect(func(item):	
		add_sprite(item)
		)
	Events.item_used.connect(func():
		remove_sprite(selected_item.name)
		)


func _process(delta):
	if selected_item == null:
		pass
	else:
		if key_selected:
			Events.key_selected.emit()
		else:
			Events.key_not_selected.emit()
		if vase_selected:
			Events.vase_selected.emit()
		else:
			Events.vase_not_selected.emit()
		if skeleton_selected:
			Events.skeleton_selected.emit(selected_item.get_child(0).texture.resource_path)
		else:
			Events.skeleton_not_selected.emit()
			
