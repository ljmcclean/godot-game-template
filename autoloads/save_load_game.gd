class_name DocsSaveLoadGame
extends Node
## Used for saving and loading the game in an encrypted binary format.
##
## This class utilizes Godot's built-in [FileAccess] to save data in a secure
## and storage conscious manner. With these upsides come some complications.
## The class must be initialized via [method initialize] each time you wish
## to save or load. To use the file you must then call [method open_file] and
## the file should be closed via [method close_file] when you are done.


## The file to save and load from. Accessed from 
## [member file_path].
var file: FileAccess
## The path to the file. Located in the [i]"user://"[/i] directory.
var file_path: String
## The password for encrypting the file data.
var password: String

#WARNING must be removed if multiple save files implemented
func _ready() -> void:
	initialize("user://savegame.sav", "password")

## Initializes SaveLoadGame with a file path and password. This class
## must be initialized before it can be used.
func initialize(f_path: String, f_password: String) -> void:
	file_path = f_path
	password = f_password

## Resets SaveLoadGame via clearance of the [member file], 
## [member file_path], and [member password] fields.
func clear() -> void:
	file = null
	file_path = ""
	password = ""

## Opens or creates the file with the given access.
## The file is encrypted and requires a password.
func open_file(access: FileAccess.ModeFlags) -> int:
	file = FileAccess.open_encrypted_with_pass(file_path, access, password)
	return FileAccess.get_open_error() if (file == null) else OK


## Closes the file. Should be executed after the file is done being used.
func close_file() -> void:
	file = null

## Calls the object's [code]serialize()[/code] method.
func serialize(object) -> void:
	object.serialize(file)

## Calls the object's [code]deserialize()[/code] method.
func deserialize(object) -> void:
	object.deserialize(file)

#TODO Finish user_prefs
## Method for saving the user's preferences. A custom file path can be used
## instead of [param prefs_path]'s default value if multiple saves are
## required. This save is not encrypted and is saved as a .cfg file.
func save_user_prefs(prefs_path: String = "user://user_prefs.cfg") -> void:
	var config := ConfigFile.new()
	var section: String = prefs_path.get_file()
	#region Audio Settings
	config.set_value(section, "master_volume", Audio.get_volume(0))
	config.set_value(section, "music_volume", Audio.get_volume(1))
	config.set_value(section, "sfx_volume", Audio.get_volume(2))
	config.set_value(section, "ambient_volume", Audio.get_volume(3))
	#endregion
	config.save(prefs_path)

#TODO Finish user_prefs
## Method for loading the user's preferences. The [param prefs_path] must match
## the file path that was used for [method save_user_prefs] or the load
## will fail. Loads user preferences into 'UserData' autoload for manipulation
## at runtime without modifying save file.
func load_user_prefs(prefs_path: String = "user://user_prefs.cfg") -> Error:
	var config := ConfigFile.new()
	var section: String = prefs_path.get_file()
	var err: Error = config.load(prefs_path)
	if err != OK:
		return err
	#region Audio Settings
	UserData.master_volume = config.get_value(section, "master_volume")
	Audio.set_volume(0, UserData.master_volume)
	UserData.music_volume = config.get_value(section, "music_volume")
	Audio.set_volume(1, UserData.music_volume)
	UserData.sfx_volume = config.get_value(section, "sfx_volume")
	Audio.set_volume(2, UserData.sfx_volume)
	UserData.ambient_volume = config.get_value(section, "ambient_volume")
	Audio.set_volume(3, UserData.ambient_volume)
	#endregion
	return OK

## Formatted structure for saving the entire game.Serializes all objects that
## need to be saved; [b]this must be updated as you add objects that need to be
## saved to your game[/b]. Returns `false` if the game fails to save. Also saves
## user's settings via [method save_user_settings]. Structure must mirror 
## [method load_game]. A return value not equal to zero indicates that the save
## has failed.
func save_game() -> int:
	save_user_prefs()
	if open_file(FileAccess.WRITE) != OK:
		return 2
	serialize(GameData)
	serialize(PlayerData)
	close_file()
	return 0

## Formatted structure for loading the entire game. Deserializes all objects 
## that need to be loaded; [b]this must be updated as you add objects that need 
## to be loaded[/b]. Returns `false` if the game fails to save. Also loadss
## user's settings via [method load_user_settings]. Structure must mirror 
## [method load_game]. A return value not equal to zero indicates that the load
## has failed.
func load_game() -> int:
	if load_user_prefs() != OK:
		return 1
	if open_file(FileAccess.READ) != OK:
		return 2
	deserialize(GameData)
	deserialize(PlayerData)
	close_file()
	return 0
