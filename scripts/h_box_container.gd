extends HBoxContainer

var correct_flag_order
var btn_slots
var flags_solved

#signal left_solved 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"1/TextureButton".connect("flags_changed", check_order)
	$"2/TextureButton".connect("flags_changed", check_order)
	$"3/TextureButton".connect("flags_changed", check_order)
	$"4/TextureButton".connect("flags_changed", check_order)
	
	correct_flag_order = ["res://assets/interactive_sprites/flag1.png", "res://assets/interactive_sprites/flag2.png", "res://assets/interactive_sprites/flag3.png", "res://assets/interactive_sprites/flag4.png"]
	flags_solved = false
	
	btn_slots = Array()
	btn_slots.append($"1/TextureButton")
	btn_slots.append($"2/TextureButton")
	btn_slots.append($"3/TextureButton")
	btn_slots.append($"4/TextureButton")

func check_order():
	print("CHECKING ORDER!")
	for i in range(0, 4):
		if btn_slots[i].texture_normal.resource_path != correct_flag_order[i]:
			#print(false)
			#return false
			flags_solved = false
			return
	#print(true)
	print("***PUZZLE SOLVED - LEFT***")
	flags_solved = true
	#emit_signal("left_solved")
	#return true
