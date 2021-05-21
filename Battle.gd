extends Node2D


# Declare member variables here. Examples:
# var a = 2
onready var enemy = $Enemy
signal enemy_turn

# Called when the node enters the scene tree for the first time.
func _ready():
	$Battle_Menu/Mage_Menu.hide()

#Knight Menu Functions
func _on_Sword_Button_pressed():
	if enemy!= null:
		enemy.hp -= $Knight.dmg
		if enemy.hp <= 0:
			enemy.queue_free()
			enemy = null
		else:
			$Battle_Menu/Mage_Menu.show()
		$Battle_Menu/Knight_Menu.hide()
		
func _on_Axe_Button_pressed():
	if enemy!= null:
		enemy.hp -= $Knight.dmg
		if enemy.hp <= 0:
			enemy.queue_free()
			enemy = null
		else:
			$Battle_Menu/Mage_Menu.show()
		$Battle_Menu/Knight_Menu.hide()
func _on_Spear_Button_pressed():
	if enemy!= null:
		enemy.hp -= $Knight.dmg
		if enemy.hp <= 0:
			enemy.queue_free()
			enemy = null
		else:
			$Battle_Menu/Mage_Menu.show()
		$Battle_Menu/Knight_Menu.hide()
func _on_Knight_Wait_Button_pressed():
	$Battle_Menu/Mage_Menu.show()
	$Battle_Menu/Knight_Menu.hide()

#Mage Menu functions
func _on_Fire_Button_pressed():
	if enemy != null:
		enemy.hp -= $Mage.dmg
		if enemy.hp <= 0:
			enemy.queue_free()
			enemy = null
	
	$Battle_Menu/Mage_Menu.hide()
	if enemy != null:
		emit_signal("enemy_turn")
		
func _on_Lightning_Button_pressed():
	if enemy != null:
		enemy.hp -= $Mage.dmg
		if enemy.hp <= 0:
			enemy.queue_free()
			enemy = null
	
	$Battle_Menu/Mage_Menu.hide()
	if enemy != null:
		emit_signal("enemy_turn")
func _on_Wind_Button_pressed():
	if enemy != null:
		enemy.hp -= $Mage.dmg
		if enemy.hp <= 0:
			enemy.queue_free()
			enemy = null
	
	$Battle_Menu/Mage_Menu.hide()
	if enemy != null:
		emit_signal("enemy_turn")
func _on_Mage_Wait_Button_pressed():
	$Battle_Menu/Mage_Menu.hide()
	if enemy != null:
		emit_signal("enemy_turn")


#trying to have the enemy attack inside of the battle function
func _on_Enemy_attack_one():
	$Knight.hp -= 3
	$Battle_Menu/Knight_Menu.show()


func _on_Enemy_attack_zero():
	$Mage.hp -= 3
	$Battle_Menu/Knight_Menu.show()








