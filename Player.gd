extends KinematicBody2D

const SPEED = 200
const FLOOR = Vector2(0, -1)
const GRAVITY = 500
const JUMP_POWER = 400
const ROCK = preload("res://Rock.tscn")

var is_firing = false
var is_dead = false
var velocity = Vector2()

var touch_left = false
var touch_right = false
var touch_jump = false
var touch_down = false
var touch_fire = false

var morkvas = 0

func add_morkva():
	morkvas += 1

func death():
	$AnimatedSprite.play("death")
	is_dead = true
	get_tree().change_scene("res://GameOver.tscn")

var lives = 0

func add_live():
	lives += 10

func _physics_process(delta):
	if is_dead:
		return
	if position.y > 800:
		position.y = 0
		get_tree().change_scene("res://GameOver.tscn")
	if is_firing == true:
		return
	if Input.is_action_pressed("ui_right") or touch_right:
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$Position2D.position.x = abs($Position2D.position.x)
		if is_on_floor():
			$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("ui_left") or touch_left:
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$Position2D.position.x = abs($Position2D.position.x) * -1
		if is_on_floor():
			$AnimatedSprite.play("walk")
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("idle")
			$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("ui_up") or touch_jump && is_on_floor():
		velocity.y = -JUMP_POWER
		$AnimatedSprite.play("jump")
	
	if Input.is_action_just_pressed("ui_accept") or touch_fire && is_firing == false && is_on_floor():
		is_firing = true
		$AnimatedSprite.play("fire")
		
	if Input.is_action_pressed("shift") && is_on_floor():
		velocity.x = -SPEED * 2

	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "fire":
		var rock = ROCK.instance()
		rock.direction = sign($Position2D.position.x)
		rock.position = $Position2D.global_position
		get_parent().add_child(rock)
		is_firing = false

func _on_left_pressed():
	touch_left = true

func _on_right_pressed():
	touch_right = true

func _on_jump_pressed():
	touch_jump = true
	
func _on_fire_pressed():
	touch_fire = true

func _on_left_released():
	touch_left = false

func _on_right_released():
	touch_right = false

func _on_jump_released():
	touch_jump = false
	
func _on_fire_released():
	touch_fire = false
