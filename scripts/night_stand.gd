extends Node2D

@onready var sprite_open: Sprite2D = $SpriteOpen
@onready var sprite_closed: Sprite2D = $SpriteClosed
@onready var nightstand_key: Node2D = $NightstandKey


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OpenButton.connect("open", change_sprite)
	sprite_open.visible = false
	nightstand_key.visible = false
	
	
func change_sprite():
	sprite_closed.visible = false
	sprite_open.visible = true
	nightstand_key.visible = true
