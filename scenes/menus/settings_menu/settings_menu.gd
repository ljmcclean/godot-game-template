extends Control


func _ready() -> void:
	SceneManager.pause_game()


func _on_button_button_up() -> void:
	SceneManager.resume_game()
	queue_free.call_deferred()
