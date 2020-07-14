extends Node2D

func _ready():
	$CanvasLayer/Exit.connect('pressed',self, "btn_menu")
	$CanvasLayer2/Restart.connect('pressed',self, "btn_restart")

func btn_menu():
	get_tree().change_scene("res://Menu.tscn")

func btn_restart():
	get_tree().change_scene("res://Level1.tscn")
