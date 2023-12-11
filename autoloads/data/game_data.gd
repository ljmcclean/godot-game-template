extends Node

var first_run : bool = true


func serialize(file : FileAccess) -> void:
	file.store_8(first_run)


func deserialize(file : FileAccess) -> void:
	first_run = file.get_8()
