extends HBoxContainer

var correct_flag_order
var btn_slots

signal right_solved 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"5/TextureButton".connect("flags_changed", check_order)
	$"6/TextureButton".connect("flags_changed", check_order)
	$"7/TextureButton".connect("flags_changed", check_order)
	$"8/TextureButton".connect("flags_changed", check_order)
	
	correct_flag_order = ["res://assets/interactive_sprites/flag5.png", "res://assets/interactive_sprites/flag6.png", "res://assets/interactive_sprites/flag7.png", "res://assets/interactive_sprites/flag8.png"]
	
	btn_slots = Array()
	btn_slots.append($"5/TextureButton")
	btn_slots.append($"6/TextureButton")
	btn_slots.append($"7/TextureButton")
	btn_slots.append($"8/TextureButton")

func check_order():
	print("CHECKING ORDER!")
	for i in range(0, 4):
		if btn_slots[i].texture_normal.resource_path != correct_flag_order[i]:
			#print(false)
			return false
	#print(true)
	print("***PUZZLE SOLVED - RIGHT***")
	emit_signal("right_solved")
	return true
