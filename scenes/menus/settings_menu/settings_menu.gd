extends Control


func _on_button_button_up() -> void:
	queue_free.call_deferred()
