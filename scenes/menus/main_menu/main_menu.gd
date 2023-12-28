extends Control


func _on_start_button_button_up():
	Scenes.load_scene("world")


func _on_settings_button_button_up():
	Scenes.add_scene_to_tree("settings_menu")


func _on_quit_button_button_up():
	Scenes.quit_game()
