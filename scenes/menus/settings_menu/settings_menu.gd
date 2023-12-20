extends Control

@onready var master_slider: HSlider = $MarginContainer/TabContainer/Audio/MarginContainer/VBoxContainer/MasterLine/MasterSlider
@onready var sfx_slider: HSlider = $MarginContainer/TabContainer/Audio/MarginContainer/VBoxContainer/SFXLine/SFXSlider
@onready var music_slider: HSlider = $MarginContainer/TabContainer/Audio/MarginContainer/VBoxContainer/MusicLine/MusicSlider


func _ready() -> void:
	SceneManager.pause_game()
	#prepare_audio()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		SceneManager.resume_game()
		queue_free.call_deferred()


#func prepare_audio() -> void:
	#master_slider.value = bus_layout.master

#region Input Mapping
func _on_jump_input_toggled(toggled_on: bool) -> void:
	if toggled_on:
		pass


func _on_left_input_toggled(toggled_on: bool) -> void:
	if toggled_on:
		pass


func _on_right_input_toggled(toggled_on: bool) -> void:
	if toggled_on:
		pass


func _on_down_input_toggled(toggled_on: bool) -> void:
	if toggled_on:
		pass
#endregion
