extends Node

var file : FileAccess
var file_path : String
var password : String

#WARNING must be removed if multiple save files implemented
func _ready() -> void:
	initialize("user://savegame.sav", "password")


func initialize(f_path : String, f_password : String) -> void:
	file_path = f_path
	password = f_password


func clear() -> void:
	file = null
	file_path = ""
	password = ""


func open_file(access : FileAccess.ModeFlags) -> int:
	file = FileAccess.open_encrypted_with_pass(file_path, access, password)
	return FileAccess.get_open_error() if (file == null) else OK


func close_file() -> void:
	file = null


func serialize(object) -> void:
	object.serialize(file)


func deserialize(object) -> void:
	object.deserialize(file)


func save_game() -> void:
	open_file(FileAccess.WRITE)
	serialize(GameData)
	serialize(PlayerData)
	close_file()


func load_game() -> void:
	open_file(FileAccess.READ)
	deserialize(GameData)
	deserialize(PlayerData)
	close_file()
