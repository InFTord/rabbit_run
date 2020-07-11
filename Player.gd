extends KinematicBody2D

const SPEED = 100
const FLOOR = Vector2()
const GRAVITY = 500
const JUMP_POWER = 300

var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$Sprite.flip_h = true
	else:
		velocity.x = 0
	
	velocity.y += (GRAVITY * delta)
	move_and_slide(velocity)
