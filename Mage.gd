extends Node2D

onready var hp_label = $HP_Label
var hp = 15 setget set_hp

var dmg = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = "HP: " + str(hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
