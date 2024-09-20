extends Node2D

var mouse_on = false
var can_be_fix = false
var is_fixed = false
var added_pieces = 0
@onready var sprite = $Sprite2D
@onready var vase_label: Label = %VaseLabel
@onready var vase_key: Node2D = $VaseKey
@onready var win_sound: AudioStreamPlayer2D = $WinSound

var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")
var go_in_cursor = preload("res://assets/cursors/enter_door_cursor.png")


func _on_area_2d_mouse_entered():
	mouse_on = true
	if !is_fixed:
		Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))

func _on_area_2d_mouse_exited():
	mouse_on = false
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(5, 7))

	
# Called when the node enters the scene tree for the first time.
func _ready():
	vase_key.visible = false
	
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
		vase_label.text = str(added_pieces) + "/4"
		if added_pieces == 4:
			is_fixed = true
			print("vase fixed")
			sprite.texture = load("res://assets/interactive_sprites/fixed_vase.png")
			vase_key.visible = true
			win_sound.play()
		
	
