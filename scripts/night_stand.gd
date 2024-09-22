extends Node2D

@onready var sprite_open: Sprite2D = $SpriteOpen
@onready var sprite_closed: Sprite2D = $SpriteClosed
@onready var nightstand_key: Node2D = $NightstandKey
@onready var open_sound: AudioStreamPlayer2D = $OpenSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OpenButton.connect("open", change_sprite)
	sprite_open.visible = false
	nightstand_key.visible = false
	
	
func change_sprite():
	sprite_closed.visible = false
	sprite_open.visible = true
	open_sound.play()
	nightstand_key.visible = true
