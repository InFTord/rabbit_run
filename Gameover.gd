extends Node2D

func _ready():
	$CanvasLayer/Restart.connect("pressed",self, "btn_rt")
	$CanvasLayer2/Menu.connect("pressed",self, "btn_mu")

func btn_rt():
	get_tree().change_scene("res://Level1.tscn")

func btn_mu():
	get_tree().change_scene("res://Menu.tscn")
