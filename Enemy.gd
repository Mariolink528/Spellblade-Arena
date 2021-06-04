extends Node2D

#variables for HP
onready var hp_label = $HP_Label
var hp = 20 setget set_hp
#Setup for the attacking


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Attacking

#updating HP
func set_hp(new_hp):
	hp = new_hp
	hp_label.text = "HP: " + str(hp)
