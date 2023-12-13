extends Control


func _on_start_button_button_up():
	SceneManager.load_scene("world")


func _on_settings_button_button_up():
	SceneManager.add_scene_to_tree("settings_menu")


func _on_quit_button_button_up():
	SceneManager.quit_game()
