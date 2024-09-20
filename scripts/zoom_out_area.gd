extends Area2D
@onready var camera: Camera2D = %Camera2D

func _ready():
	connect("body_entered", zoom_out)
	connect("body_exited", reset)
	
func zoom_out(body):
	camera.zoom -= Vector2(1.0, 1.0)
	
func reset(body):
	camera.zoom += Vector2(1.0, 1.0)
