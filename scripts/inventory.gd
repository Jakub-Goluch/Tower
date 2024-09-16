extends HBoxContainer

@onready var inventory = $"."
var selected_item = null


func remove_sprite(name: String) -> void:
	for child in inventory.get_children():
		if child.name == name:
			child.get_child(0).texture = null
			selected_item.get_node("whiteground").visible = false
			selected_item = null

func add_sprite(name: String) -> void:
	for child in inventory.get_children():
		if child.name == name:
			child.get_child(0).texture = load("res://.godot/imported/Dungeon_Tileset.png-86e6a28e5a50f836ca9e00bd5d864744.ctex")

func _ready() -> void:
	Events.item_selected.connect(func(item):
		if selected_item != null:
			selected_item.get_node("whiteground").visible = false
		selected_item = item
		item.get_node("whiteground").visible = true
		)


func _process(delta):
	if Input.is_action_just_pressed("up"):
		print("dupa")
		if selected_item == null:
			pass
		else:
			remove_sprite(selected_item.name)
		
	if Input.is_action_just_pressed("down"):
		print("cipa")
		if selected_item == null:
			pass
		else:
			add_sprite(selected_item.name)
