extends Node2D


var hp = 20

signal attack_one
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Battle_enemy_turn():
	
	emit_signal("attack_one")

