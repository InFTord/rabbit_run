extends KinematicBody2D

const SPEED = 200
const FLOOR = Vector2(0, -1)
const GRAVITY = 500
const JUMP_POWER = 400

var velocity = Vector2()
var direction = 1
var is_alive = true
var is_attacking = false
var pop
var jpop

var is_right
var is_left

func kill():
	is_alive = false
	velocity.x = 0
	$AnimatedSprite.play("death")
	$CollisionShape2D.set_deferred("disabled", true)
	$DeathCollision.set_deferred("disabled",false)


func right():
	if is_alive == true && is_attacking == false:
		velocity.x = SPEED * direction
		$AnimatedSprite.play("run")
		direction = -1
		$AnimatedSprite.flip_h = true
		$CollisionShape2D.position.x = -1
	
func left():
	if is_alive == true && is_attacking == false:
		velocity.x = SPEED * direction
		$AnimatedSprite.play("run")
		direction = 1
		$AnimatedSprite.flip_h = false
		$CollisionShape2D.position.x = 1

func jump():
	if is_on_floor():
		velocity.y = -JUMP_POWER

	
func _physics_process(delta):
	#if is_alive == true && is_attacking == false:
	#	velocity.x = SPEED * direction
	#	$AnimatedSprite.play("run")
	#velocity.y += (GRAVITY * delta)
	#velocity = move_and_slide(velocity, FLOOR)
	#if is_on_wall():
	#	change_direction()
	if pop != null:
		if !(pop as String == "jump") && pop < self.transform.origin.x && !(pop in range(self.transform.origin.x - 2,
		 self.transform.origin.x + 2)):
			right()
#			print(self.transform.origin.x)
			
		elif !(pop as String == "jump") && pop > self.transform.origin.x && !(pop in range(self.transform.origin.x - 2,
		 self.transform.origin.x + 2)):
			left()
#			print(self.transform.origin.x)
		
		elif pop as String == "jump" && jpop < self.transform.origin.y && !(jpop in range(self.transform.origin.y - 2,
		 self.transform.origin.y + 2)):
			jump()
			
		else:
			pop = AIW.pop()
			if !(pop == null) && pop as String == "jump":
				jpop = AIW.pop()
			
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)
	velocity.x = 0
		
		

func _ready(): # testing
	pop = self.transform.origin.x
	AIW.push(200)
	AIW.push(400)
	AIW.push(600)
	AIW.push("jump")
	AIW.push(200)
	AIW.push(100)

#func _on_Area2D_body_entered(body):
#	if is_alive && "Player" in body.name:
#		is_attacking = true
#		$AnimatedSprite.play("attack")
#		body.die()
		


#func _on_AnimatedSprite_animation_finished():
	#if $AnimatedSprite.animation == "attack":
	#	is_attacking = false


func _on_Area2D_body_entered(body):
#	if is_alive && "Player" in body.name:
#		body.death()
	return
