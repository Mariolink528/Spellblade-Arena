extends Node2D
# Declare member variables here. Examples:
# var a = 2
onready var enemy = $Enemy
signal enemy_turn
onready var window = "false"
onready var attack = 0

var rng = RandomNumberGenerator.new()
var target = 0
signal attack_one
signal attack_zero
const enemy_scene =  preload("res://Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Battle_Menu/Mage_Menu.hide()
	$ACDisplay.hide()
	$Battle_Menu/Next_Battle.hide()
#Knight Menu Functions
func _on_Sword_Button_pressed():
	if enemy!= null:
		attack = 1
		$StartWindow.start(0.5)
		$EndWindow.start(1)
		$ACDisplay.frame = 0
		$ACDisplay.show()	
	$Battle_Menu/Knight_Menu.hide()		
func _on_Axe_Button_pressed():
	if enemy!= null:
		attack = 2
		$StartWindow.start(1)
		$EndWindow.start(1.5)
		$ACDisplay.frame = 0
		$ACDisplay.show()	
	$Battle_Menu/Knight_Menu.hide()
func _on_Spear_Button_pressed():
	if enemy!= null:
		attack = 3
		$StartWindow.start(0.5)
		$EndWindow.start(1)
		$ACDisplay.frame = 0
		$ACDisplay.show()	
	$Battle_Menu/Knight_Menu.hide()
func _on_Knight_Wait_Button_pressed():
	$Battle_Menu/Mage_Menu.show()
	$Battle_Menu/Knight_Menu.hide()
#Mage Menu functions
func _on_Fire_Button_pressed():
	if enemy!= null:
		attack = 4
		$StartWindow.start(0.5)
		$EndWindow.start(1)
		$ACDisplay.frame = 2
		$ACDisplay.show()	
	$Battle_Menu/Mage_Menu.hide()		
func _on_Lightning_Button_pressed():
	if enemy!= null:
		attack = 5
		$StartWindow.start(0.5)
		$EndWindow.start(1)
		$ACDisplay.frame = 2
		$ACDisplay.show()	
	$Battle_Menu/Mage_Menu.hide()
func _on_Wind_Button_pressed():
	if enemy!= null:
		attack = 4
		$StartWindow.start(0.5)
		$EndWindow.start(1)
		$ACDisplay.frame = 2
		$ACDisplay.show()	
	$Battle_Menu/Mage_Menu.hide()
func _on_Mage_Wait_Button_pressed():
	$Battle_Menu/Mage_Menu.hide()
	if enemy != null:
		emit_signal("enemy_turn")


#trying to have the enemy attack inside of the battle function
func _on_Battle_attack_one():
	attack = 7
	window = "Knight"
	$StartWindow.start(0.5)
	$ACDisplay.frame = 0
	$EndWindow.start(1)
	$ACDisplay.show()
func _on_Battle_attack_zero():
	attack = 8
	window = "Mage"
	$StartWindow.start(0.5)
	$EndWindow.start(1)
	$ACDisplay.frame = 2
	$ACDisplay.show()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_X:
			if window == "Knight":
				if attack == 1:
					enemy.hp -= $Knight.dmg
					window = "false"
					$StartWindow.stop()
					$EndWindow.stop()
					$ACDisplay.hide()
					if enemy.hp <= 0:
						enemy.queue_free()
						enemy = null
						$Battle_Menu/Next_Battle.show()
					else:
						$Battle_Menu/Mage_Menu.show()
				elif attack == 2:
					enemy.hp -= $Knight.dmg
					window = "false"
					$StartWindow.stop()
					$EndWindow.stop()
					$ACDisplay.hide()
					if enemy.hp <= 0:
						enemy.queue_free()
						enemy = null
						$Battle_Menu/Next_Battle.show()
					else:
						$Battle_Menu/Mage_Menu.show()
				elif attack == 3:
					enemy.hp -= $Knight.dmg
					window = "false"
					$StartWindow.stop()
					$EndWindow.stop()
					$ACDisplay.hide()
					if enemy.hp <= 0:
						enemy.queue_free()
						enemy = null
						$Battle_Menu/Next_Battle.show()
					else:
						$Battle_Menu/Mage_Menu.show()
				elif attack == 7:
					$Battle_Menu/Knight_Menu.show()
					$ACDisplay.frame = 0
					$ACDisplay.hide()
					$EndWindow.stop()
		if event.pressed and event.scancode == KEY_C:
			if window == "Mage":
				if attack == 4:
					enemy.hp -= $Mage.dmg
					window = "false"
					if enemy.hp <= 0:
						enemy.queue_free()
						enemy = null
						$StartWindow.stop()
						$EndWindow.stop()
						$ACDisplay.hide()
						$Battle_Menu/Next_Battle.show()
					else:
						emit_signal("enemy_turn")
				elif attack == 5:
					enemy.hp -= $Mage.dmg
					window = "false"
					if enemy.hp <= 0:
						enemy.queue_free()
						enemy = null
						$StartWindow.stop()
						$EndWindow.stop()
						$ACDisplay.hide()
						$Battle_Menu/Next_Battle.show()
					else:
						emit_signal("enemy_turn")
				elif attack == 6:
					enemy.hp -= $Mage.dmg
					window = "false"
					if enemy.hp <= 0:
						enemy.queue_free()
						enemy = null
						$StartWindow.stop()
						$EndWindow.stop()
						$ACDisplay.hide()
						$Battle_Menu/Next_Battle.show()
					else:
						emit_signal("enemy_turn")
				elif attack == 8:
					$Battle_Menu/Knight_Menu.show()
					$ACDisplay.frame = 0
					$ACDisplay.hide()
					$EndWindow.stop()


func _on_StartWindow_timeout():
	if attack >= 4 and attack != 7:
		$ACDisplay.frame = 3
		window = "Mage"
	else:
		$ACDisplay.frame = 1
		window = "Knight"


func _on_EndWindow_timeout():
	window = "false"
	if attack == 7:
		$Knight.hp -= 3
		attack = 0
		$Battle_Menu/Knight_Menu.show()
	if attack == 8:
		$Mage.hp -= 3
		attack = 0
		$Battle_Menu/Knight_Menu.show()
	if attack > 0 and attack < 4:
		$Battle_Menu/Mage_Menu.show()
	if attack >= 4 and attack <= 6: 
		emit_signal("enemy_turn")
	else:
		$ACDisplay.frame = 0
		$ACDisplay.hide()
	


func _on_Next_Battle_pressed():
	add_child(enemy_scene.instance())
	enemy = $Enemy
	$Battle_Menu/Next_Battle.hide()
	$Battle_Menu/Knight_Menu.show()
	pass

func _on_Battle_enemy_turn():
	rng.randomize()
	target = rng.randi_range(0, 1)
	if target == 1:
		emit_signal("attack_one")
	else:
		emit_signal("attack_zero")
