class_name DocsSaveLoad
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

## Formatted structure for saving the entire game.Serializes all objects that
## need to be saved; [b]this must be updated as you add objects that need to be
## saved to your game[/b]. Returns `false` if the game fails to save. Also saves
## user's settings via [method save_user_settings]. Structure must mirror 
## [method load_game]. A return value not equal to zero indicates that the save
## has failed.
func save_game() -> int:
	if open_file(FileAccess.WRITE) != OK:
		return 1
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
	if open_file(FileAccess.READ) != OK:
		return 1
	deserialize(GameData)
	deserialize(PlayerData)
	close_file()
	return 0
