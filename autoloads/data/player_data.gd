extends Node

var spawn_location : Vector2i


func serialize(file : FileAccess) -> void:
	file.store_32(spawn_location.x)
	file.store_32(spawn_location.y)


func deserialize(file : FileAccess) -> void:
	spawn_location.x = file.get_32()
	spawn_location.y = file.get_32()
