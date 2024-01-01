class_name DocsUserPrefs
extends Node
## Class for managing user preferences.
##
## Provides several functions for storing, loading, manipulating, and applying
## user preferences. This can include audio settings, video settings, controls,
## etc.

## Exported resource for storing user preferences at runtime. Can be found at
## [i]"res://common/resources/user_data/user_data.tres"[/i].
@export var user_data: Resource

## Initializes [member user_data] resource values to active settings.
func initialize() -> void:
	user_data.master_volume = Audio.get_volume(0)
	user_data.music_volume = Audio.get_volume(1)
	user_data.sfx_volume = Audio.get_volume(2)
	user_data.ambient_volume = Audio.get_volume(3)
	user_data.controls["up"] = InputMap.action_get_events("up")
	user_data.controls["down"] = InputMap.action_get_events("down")
	user_data.controls["left"] = InputMap.action_get_events("left")
	user_data.controls["right"] = InputMap.action_get_events("right")

## Method for saving the user's preferences. A custom file path can be used
## instead of [param prefs_path]'s default value if multiple saves are
## required. This save is not encrypted and is saved as a .cfg file.
func save_user_prefs(prefs_path: String = "user://user_prefs.cfg") -> void:
	var config := ConfigFile.new()
	var section: String = prefs_path.get_file()
	#region Audio Settings
	config.set_value(section, "master_volume", user_data.master_volume)
	config.set_value(section, "music_volume", user_data.music_volume)
	config.set_value(section, "sfx_volume", user_data.sfx_volume)
	config.set_value(section, "ambient_volume", user_data.ambient_volume)
	#endregion
	#region Controls
	config.set_value(section, "up", user_data.controls["up"])
	config.set_value(section, "down", user_data.controls["down"])
	config.set_value(section, "left", user_data.controls["left"])
	config.set_value(section, "right", user_data.controls["right"])
	#endregion
	config.save(prefs_path)

## Method for loading the user's preferences. The [param prefs_path] must match
## the file path that was used for [method save_user_prefs] or the load
## will fail. Loads user preferences into [member user_data] resource so that settings
## may be modified at runtime without affecting the save file; additionally, 
## applies the settings.
func load_user_prefs(prefs_path: String = "user://user_prefs.cfg") -> Error:
	var config := ConfigFile.new()
	var section: String = prefs_path.get_file()
	var err: Error = config.load(prefs_path)
	if err != OK:
		return err
	#region Audio Settings
	user_data.master_volume = config.get_value(section, "master_volume")
	Audio.set_volume(0, user_data.master_volume)
	user_data.music_volume = config.get_value(section, "music_volume")
	Audio.set_volume(1, user_data.music_volume)
	user_data.sfx_volume = config.get_value(section, "sfx_volume")
	Audio.set_volume(2, user_data.sfx_volume)
	user_data.ambient_volume = config.get_value(section, "ambient_volume")
	Audio.set_volume(3, user_data.ambient_volume)
	#endregion
	return OK
