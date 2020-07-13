extends Node2D

func _ready():
	$Play.connect('pressed', self, "game")
	$Exit.connect('pressed', self, "btn_exit")

func game():
	get_tree().change_scene("res://Level1.tscn")

func btn_exit():
	get_tree().quit()
