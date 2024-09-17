extends Node2D

@onready var sprite_open: Sprite2D = $SpriteOpen
@onready var sprite_closed: Sprite2D = $SpriteClosed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OpenButton.connect("open", change_sprite)
	sprite_open.visible = false
	
func change_sprite():
	sprite_closed.visible = false
	sprite_open.visible = true
