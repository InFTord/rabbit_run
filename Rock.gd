extends Area2D

const SPEED = 500
export var direction = 1
var velocity = Vector2()
var GRAVITY = 0.10

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	velocity.y += GRAVITY
	if(direction == -1):
		$Sprite.flip_h = true
	translate(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Rock_body_entered(body):
	if "Wolf" in body.name:
		body.kill()
	queue_free()
