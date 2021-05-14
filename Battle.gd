extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal enemy_turn

# Called when the node enters the scene tree for the first time.
func _ready():
	$Battle_Menu/Mage_Menu.hide()

#Knight Menu Functions
func _on_Sword_Button_pressed():
	$Enemy.hp -= $Knight.dmg
	if $Enemy.hp <= 0:
		$Enemy.queue_free()
	$Battle_Menu/Knight_Menu.hide()
	$Battle_Menu/Mage_Menu.show()


#Mage Menu functions
func _on_Fire_Button_pressed():
	$Enemy.hp -= $Mage.dmg
	if $Enemy.hp <= 0:
		$Enemy.queue_free()
	$Battle_Menu/Mage_Menu.hide()
	emit_signal("enemy_turn")


#enemy turn connection
func _on_Enemy_player_turn():
		$Battle_Menu/Knight_Menu.show()

