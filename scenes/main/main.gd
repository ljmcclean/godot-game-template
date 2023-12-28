extends Node


func _ready() -> void:
	if GameData.first_run:
		GameData.first_run = false
		SaveLoad.save_game()
