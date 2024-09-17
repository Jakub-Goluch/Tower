extends Camera2D
@onready var camera = %Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.teleport_position.connect(func(position):
		camera.global_position = position
		)
