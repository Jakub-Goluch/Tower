extends Node2D

var destroyed = false
@onready var sprite: Sprite2D = $Sprite2D
@onready var sprite2: Sprite2D = $Sprite2D2
@onready var lever_left: Node2D = $LeverLeft
@onready var break_sound: AudioStreamPlayer2D = $BreakSound


var hand_cursor = preload("res://assets/cursors/hand_cursor.png")
var normal_cursor = preload("res://assets/cursors/normal_cursor.png")

func _ready():
	$SunflowerButton.connect("pressed", destroy_sunflower)
	sprite.visible = true
	sprite2.visible = false
	lever_left.process_mode = Node.PROCESS_MODE_DISABLED
	
	$SunflowerButton.connect("mouse_entered", change_cursor)
	$SunflowerButton.connect("mouse_exited", reset_cursor)

func destroy_sunflower():
	if !destroyed:
		sprite.visible = false
		sprite2.visible = true
		break_sound.play()
		lever_left.process_mode = Node.PROCESS_MODE_ALWAYS
		destroyed = true
	
	
func change_cursor():
	if !destroyed:
		Input.set_custom_mouse_cursor(hand_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
		
func reset_cursor():
	Input.set_custom_mouse_cursor(normal_cursor, Input.CURSOR_ARROW, Vector2(6, 7))
		
