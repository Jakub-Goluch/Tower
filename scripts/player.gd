extends CharacterBody2D

var speed = 100.0
var click_position = Vector2()
var target_position = Vector2()

# so the player doesn't move back to 0,0 on start
func _ready():
	click_position = position

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left_mouse"):
		click_position  = get_global_mouse_position()
	
	if position.distance_to(target_position) < 3:
		$AnimatedSprite2D.play("idle")
		
	if position.distance_to(target_position) > 3:
		target_position = (click_position - position).normalized()
		velocity = target_position * speed
		
		if click_position.x > position.x:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("walk")
		elif click_position.x < position.x:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("walk")
		move_and_slide()
