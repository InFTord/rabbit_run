extends KinematicBody2D

const SPEED = 100
const FLOOR = Vector2(0, -1)
const GRAVITY = 300

var velocity = Vector2()
var direction = 1
var is_alive = true
var is_attacking = false

func kill():
	is_alive = false
	velocity.x = 0
	$AnimatedSprite.play("death")
	$CollisionShape2D.set_deferred("disabled", true)
	$DeathCollision.set_deferred("disabled",false)
	
func _physics_process(delta):
	if is_alive == true && is_attacking == false:
		velocity.x = SPEED * direction
		$AnimatedSprite.play("run")
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)
	if is_on_wall():
		change_direction()
#		direction = direction * -1
#		$RayCast2D.position.x *= -1
#	if $RayCast2D. is_colliding() == false:
#		direction = direction * -1
#		$RayCast2D.position.x *= -1
#	if get_slide_count() > 0:
#		for i in range (get_slide_count()):
#			if "Player" in get_slide_count(i).collider.name:
#				get_tree().change_scene(Target_stage)

func change_direction():
	direction *= -1
	$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
	$CollisionShape2D.position.x *= (-1)

#func _on_Area2D_body_entered(body):
#	if is_alive && "Player" in body.name:
#		is_attacking = true
#		$AnimatedSprite.play("attack")
#		body.die()
		


#func _on_AnimatedSprite_animation_finished():
	#if $AnimatedSprite.animation == "attack":
	#	is_attacking = false


func _on_Area2D_body_entered(body):
	if is_alive && "Player" in body.name:
		body.death()
