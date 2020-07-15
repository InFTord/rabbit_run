extends Node2D

func _ready():
# warning-ignore:return_value_discarded
	$Play.connect("pressed", self, "btn_new_game")
# warning-ignore:return_value_discarded
	$Exit.connect("pressed", self, "btn_exit")

func btn_new_game():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Level1.tscn")

func btn_exit():
	get_tree().quit()
