extends Node2D

func _ready():
	$Play.connect('pressed', self, "btn_new_game")
	$Exit.connect('pressed', self, "btn_exit")

func btn_new_game():
	get_tree().change_scene("res://Level1.tscn")
func btn_exit():
	get_tree().guit()
