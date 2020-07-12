extends KinematicBody2D

const SPEED = 100
const FLOOR = Vector2(0, -1)
const GRAVITY = 500
const JUMP_POWER = 400
const ROCK = preload("res://Rock.tscn")

var velocity = Vector2()

func _physics_process(delta):
	if position.y > 800:
		position.y = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$Position2D.position.x = abs($Position2D.position.x)
		if is_on_floor():
			$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$Position2D.position.x = abs($Position2D.position.x) * (-1)
		if is_on_floor():
			$AnimatedSprite.play("walk")
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity.y = -JUMP_POWER
		$AnimatedSprite.play("jump")
	
	if Input.is_action_just_pressed("ui_accept"):
		var rock = ROCK.instance()
		rock.direction = sign($Position2D.position.x)
		rock.position = $Position2D.global_position
		get_parent().add_child(rock)
	
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)
