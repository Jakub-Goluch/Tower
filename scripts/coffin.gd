extends Node2D

var mouse_on = false
var can_be_fix = false
var is_fixed = false
var added_pieces = 0
var sprite_path = null
@onready var sprite = $Sprite2D

func _on_area_2d_mouse_entered():
	mouse_on = true


func _on_area_2d_mouse_exited():
	mouse_on = false
	
# Called when the node enters the scene tree for the first time.
func _ready():
	Events.skeleton_selected.connect(func(path):
		can_be_fix = true
		sprite_path = path
		)
		
	Events.skeleton_not_selected.connect(func():
		can_be_fix = false
		)
	Events.item_used.connect(func():
		can_be_fix = false
		)

func _process(delta):
		
	if Input.is_action_just_pressed("mouse_click") and mouse_on and can_be_fix and !is_fixed:
		Events.item_used.emit()
		added_pieces += 1
		if sprite_path == "res://assets/pickup_items/trup3.png":
			sprite.texture = load("res://assets/interactive_sprites/coffin_skeleton_body.png")
		else:
			sprite.texture = load("res://assets/interactive_sprites/coffin_skeleton_head.png")
		if added_pieces == 2:
			is_fixed = true
			print("coffin fixed")
			sprite.texture = load("res://assets/interactive_sprites/coffin_skeleton.png")
		
		
		
	
