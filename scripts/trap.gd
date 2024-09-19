extends Node2D

var mouse_on = false
var can_be_open = false
@onready var animated_sprite = $AnimatedSprite2D
var is_open = false
@onready var marker = $Marker


func _on_area_2d_mouse_entered():
	mouse_on = true


func _on_area_2d_mouse_exited():
	mouse_on = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.key_selected.connect(func():
		can_be_open = true
		)
		
	Events.key_not_selected.connect(func():
		can_be_open = false
		)
	Events.item_used.connect(func():
		can_be_open = false
		)

func _process(delta):
	if Input.is_action_just_pressed("mouse_click") and is_open and mouse_on:
		Events.teleport_position.emit(marker.global_position)
	
	if Input.is_action_just_pressed("mouse_click") and can_be_open and !is_open and mouse_on:
		is_open = true
		animated_sprite.play("open")
		Events.item_used.emit()
		

		
