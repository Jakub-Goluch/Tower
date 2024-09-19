extends Node2D

var mouse_on = false
var can_be_fix = false
var is_fixed = false
var added_pieces = 0
@onready var sprite = $Sprite2D

func _on_area_2d_mouse_entered():
	mouse_on = true


func _on_area_2d_mouse_exited():
	mouse_on = false
	
# Called when the node enters the scene tree for the first time.
func _ready():
	Events.vase_selected.connect(func():
		can_be_fix = true
		)
		
	Events.vase_not_selected.connect(func():
		can_be_fix = false
		)
	Events.item_used.connect(func():
		can_be_fix = false
		)

func _process(delta):
		
	if Input.is_action_just_pressed("mouse_click") and mouse_on and can_be_fix and !is_fixed:
		Events.item_used.emit()
		added_pieces += 1
		if added_pieces == 4:
			is_fixed = true
			print("vase fixed")
			sprite.texture = load("res://assets/interactive_sprites/fixed_vase.png")
		
		
		
	
