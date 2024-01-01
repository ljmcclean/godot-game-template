class_name DocsAudio
extends Node
## Provides functions for managing game audio.
##
## This class can be used in lieu of low-level interactions with Godot's
## [AudioServer]. The abstraction can be used to keep code elsewhere cleaner
## and prevent inconsistent handling of transitions or effects.

## Sets the volume of the specified bus given a percentage value for volume.
func set_volume(bus_index: int, volume: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(volume))

## Returns the linear volume of the given bus index.
func get_volume(bus_index: int) -> float:
	return linear_to_db(AudioServer.get_bus_volume_db(bus_index))

## Mutes the specified bus index. 
func mute_bus(bus_index: int) -> void:
	AudioServer.set_bus_mute(bus_index, true)

## Unmutes the specified bus index.
func unmute_bus(bus_index: int) -> void:
	AudioServer.set_bus_mute(bus_index, false)

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
