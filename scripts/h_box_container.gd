extends HBoxContainer

var correct_flag_order
var btn_slots

var left_solved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"1/TextureButton".connect("flags_changed", check_order)
	$"2/TextureButton".connect("flags_changed", check_order)
	$"3/TextureButton".connect("flags_changed", check_order)
	$"4/TextureButton".connect("flags_changed", check_order)
	
	correct_flag_order = ["res://assets/flag1.png", "res://assets/flag2.png", "res://assets/flag3.png", "res://assets/flag4.png"]
	
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
			return false
	#print(true)
	print("***PUZZLE SOLVED - LEFT***")
	left_solved = true
	return true
