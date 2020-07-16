extends Area2D

export(String, FILE, "*	.tscn") var Target_stage


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene("res://GameOver.tscn")
