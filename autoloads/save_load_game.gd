extends Node
## Used for saving and loading the game in an encrypted binary format.

## The file to save and load from.
var file : FileAccess
## The path to the file.
var file_path : String
## The password for encrypting the file data.
var password : String

#WARNING must be removed if multiple save files implemented
func _ready() -> void:
	initialize("user://savegame.sav", "password")

## Initializes SaveLoadGame with a file path and password.
func initialize(f_path : String, f_password : String) -> void:
	file_path = f_path
	password = f_password

## Resets SaveLoadGame.
func clear() -> void:
	file = null
	file_path = ""
	password = ""

## Opens or creates the file with the given access.
func open_file(access : FileAccess.ModeFlags) -> int:
	file = FileAccess.open_encrypted_with_pass(file_path, access, password)
	return FileAccess.get_open_error() if (file == null) else OK

## Closes the file.
func close_file() -> void:
	file = null

## Calls serialize() on the object.
func serialize(object) -> void:
	object.serialize(file)

## Calls deserialize() on the object.
func deserialize(object) -> void:
	object.deserialize(file)

## Formatted structure for saving the entire game.
## (Structure mirrors load_game())
func save_game() -> void:
	open_file(FileAccess.WRITE)
	serialize(GameData)
	serialize(PlayerData)
	close_file()

## Formatted structure for loading the entire game.
## (Structure mirrors save_game())
func load_game() -> void:
	open_file(FileAccess.READ)
	deserialize(GameData)
	deserialize(PlayerData)
	close_file()
