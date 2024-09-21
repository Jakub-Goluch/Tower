extends CharacterBody2D


const SPEED = 60.0
const JUMP_VELOCITY = 0.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var walking_sound: AudioStreamPlayer2D = $WalkingSound


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction: # right
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("move_left"):
		animated_sprite.flip_h = false
		animated_sprite.play("walk")
		walking_sound.play()
	elif Input.is_action_pressed("move_right"):
		animated_sprite.flip_h = true
		animated_sprite.play("walk")
		walking_sound.play()
	elif Input.is_action_just_released("move_left") || Input.is_action_just_released("move_right"):
		animated_sprite.flip_h = false
		animated_sprite.play("idle")
		walking_sound.stop()
		pass
	
	move_and_slide()
