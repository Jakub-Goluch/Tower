extends HBoxContainer

var correct_flag_order
var btn_slots
var flags_solved

#signal right_solved 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"5/TextureButton".connect("flags_changed", check_order)
	$"6/TextureButton".connect("flags_changed", check_order)
	$"7/TextureButton".connect("flags_changed", check_order)
	$"8/TextureButton".connect("flags_changed", check_order)
	

	correct_flag_order = ["res://assets/interactive_sprites/flag5.png", "res://assets/interactive_sprites/flag6.png", "res://assets/interactive_sprites/flag7.png", "res://assets/interactive_sprites/flag8.png"]
	flags_solved = false
	
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
			flags_solved = false
			print("***PUZZLE NOT SOLVED - RIGHT***")
			return
	#print(true)
	print("***PUZZLE SOLVED - RIGHT***")
	flags_solved = true
	#emit_signal("right_solved")
	#return true
