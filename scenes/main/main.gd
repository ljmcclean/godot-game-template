extends Node


func _ready() -> void:
	if GameData.first_run:
		GameData.first_run = false
		SaveLoadGame.save_game()
