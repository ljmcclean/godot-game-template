class_name DocsAudioManager
extends Node
## Provides functions for managing game audio.

## Sets the volume of the specified bus given a percentage value for volume.
func set_volume(bus_index: int, volume: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(volume))

## Fades bus volume from current to given volume, as a percentage,
## over duration.
func fade_in(bus_index: int, volume: float, duration: float) -> void:
	var tween := get_tree().create_tween()
	tween.tween_method(set_volume.bind(bus_index), 
	AudioServer.get_bus_volume_db(bus_index), linear_to_db(volume), duration)

## Fades bus volume out over given duration to zero.
func fade_out(bus_index: int, duration: float) -> void:
	var tween := get_tree().create_tween()
	tween.tween_method(set_volume.bind(bus_index), 
	AudioServer.get_bus_volume_db(bus_index), 0, duration)
