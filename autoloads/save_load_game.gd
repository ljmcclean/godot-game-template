class_name DocsSaveLoadGame
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
## The file is encrypted and requires a password.
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


## Formatted structure for saving user settings to a .cfg file.
func save_settings() -> void:
	var config = ConfigFile.new()
	for setting in Settings.audio_settings:
		config.set_value("audio_settings", setting, Settings.audio_settings[setting])
	for setting in Settings.controls_settings:
		config.set_value("controls_settings", setting, Settings.controls_settings[setting])
	for setting in Settings.video_settings:
		config.set_value("video_settings", setting, Settings.video_settings[setting])
	for setting in Settings.game_settings:
		config.set_value("game_settings", setting, Settings.game_settings[setting])
	config.save("user://settings.cfg")


## Formatted structure for loading user settings from a .cfg file.
func load_settings() -> Error:
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")
	if (err != OK):
		return err 
	for setting in config.get_section_keys("audio_settings"):
		Settings.audio_settings[setting] = config.get_value("audio_settings", setting)
	for setting in config.get_section_keys("controls_settings"):
		Settings.controls_settings[setting] = config.get_value("controls_settings", setting)
	for setting in config.get_section_keys("video_settings"):
		Settings.video_settings[setting] = config.get_value("video_settings", setting)
	for setting in config.get_section_keys("game_settings"):
		Settings.game_settings[setting] = config.get_value("game_settings", setting)
	return err
