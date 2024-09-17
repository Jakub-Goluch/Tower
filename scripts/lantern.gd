extends Node2D

@onready var sprite_on: Sprite2D = $Sprite_ON
@onready var sprite_off: Sprite2D = $Sprite_OFF
@onready var aura: PointLight2D = $Aura
var won: bool # disable light switching after solving the puzzle

func _ready():
	$Button.connect("switch", change_light)
	sprite_on.visible = true
	sprite_off.visible = true
	aura.visible = false
	
func change_light(name):
	if !won:
		sprite_off.visible = !sprite_off.visible # negate

func turn_off():
	sprite_off.visible = true
	
func win():
	sprite_off.visible = false
	aura.visible = true
	won = true
