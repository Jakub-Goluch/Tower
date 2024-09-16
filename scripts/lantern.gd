extends Node2D

@onready var sprite_on: Sprite2D = $Sprite_ON
@onready var sprite_off: Sprite2D = $Sprite_OFF

func _ready():
	$Button.connect("switch", change_light)
	sprite_on.visible = true
	sprite_off.visible = true
	
func change_light():
	sprite_off.visible = !sprite_off.visible
