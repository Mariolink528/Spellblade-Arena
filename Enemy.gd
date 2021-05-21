extends Node2D

#variables for HP
onready var hp_label = $HP_Label
var hp = 20 setget set_hp
#Setup for the attacking
var rng = RandomNumberGenerator.new()
var target = 0
signal attack_one
signal attack_zero

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Attacking
func _on_Battle_enemy_turn():
	rng.randomize()
	target = rng.randi_range(0, 1)
	if target == 1:
		emit_signal("attack_one")
	else:
		emit_signal("attack_zero")
#updating HP
func set_hp(new_hp):
	hp = new_hp
	hp_label.text = "HP: " + str(hp)
