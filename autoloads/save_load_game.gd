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
	
	config.save(file_path)

#TODO Finish user_prefs
## Method for loading the user's preferences. The [param prefs_path] must match
## the file path that was used for [method save_user_prefs] or the load
## will fail.
func load_user_prefs(prefs_path: String = "user://user_prefs.cfg") -> void:
	var config := ConfigFile.new()
	var err: Error = config.load(file_path)
	if err != OK:
		return

## Formatted structure for saving the entire game.
## Structure must mirror [code]load_game()[/code].
func save_game() -> void:
	open_file(FileAccess.WRITE)
	serialize(GameData)
	serialize(PlayerData)
	close_file()

## Formatted structure for loading the entire game.
## Structure must mirror [code]save_game()[/code].
func load_game() -> void:
	open_file(FileAccess.READ)
	deserialize(GameData)
	deserialize(PlayerData)
	close_file()
