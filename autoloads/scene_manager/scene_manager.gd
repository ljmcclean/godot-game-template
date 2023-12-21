class_name DocsSceneManager
extends Node
## Used for managing, loading, removing, and switching scenes.
##
## Provides more convenient and customizable methods for changing scenes such
## as abstracting the process for loading a scene additively and allowing 
## scenes to be changed with a transition.


## Scene aliases, informal names given for scenes, are keyed to those scenes'
## paths. It is [b]critical[/b] that this is updated when scene file locations are
## changed or new scenes are added.
var scenes: Dictionary = {
	"main_scene": "res://scenes/main/main.tscn",
	"main_menu": "res://scenes/menus/main_menu/main_menu.tscn",
	"settings_menu": "res://scenes/menus/settings_menu/settings_menu.tscn",
	"loading_screen": "res://scenes/menus/loading_screen/loading_screen.tscn",
	"world": "res://scenes/world/world.tscn",
}

## The alias for the currently active scene.
var current_scene_alias: String = ""
## The path for the scene to be loaded (used by [method load_scene]).
var load_scene_path: StringName


func _ready() -> void:
	current_scene_alias = "main_scene"

## Adds a scene's alias and path to [member scenes].
func add_scene(scene_alias: String, scene_path: String) -> void:
	scenes[scene_alias] = scene_path

## Removes a scene's alias and path from [member scenes].
func remove_scene(scene_alias: String) -> void:
	scenes.erase(scene_alias)

## Clears the tree and adds the new scene (updates [member current_scene_alias]).
func switch_scene(scene_alias: String) -> void:
	get_tree().change_scene_to_file(scenes[scene_alias])
	current_scene_alias = scene_alias

## Replaces tree with [LoadingScreen] and loads the new scene 
## (updates [member current_scene_alias]).
func load_scene(scene_alias: String) -> void:
	load_scene_path = scenes[scene_alias]
	get_tree().change_scene_to_file.call_deferred(scenes["loading_screen"])
	current_scene_alias = scene_alias

## Additively loads the new scene to the scene tree.
func add_scene_to_tree(scene_alias: String) -> void:
	var new_scene = load(scenes[scene_alias]).instantiate()
	get_tree().root.add_child.call_deferred(new_scene)

## Restarts the scene.
func restart_scene() -> void:
	get_tree().reload_current_scene()

## Sets [member SceneTree.paused] for the scene tree to true. This pauses all
## nodes whose [member Node.process_mode] is set to 
## [constant Node.PROCESS_MODE_PAUSABLE].
func pause_game() -> void:
	get_tree().paused = true

## Changes [member SceneTree.paused] for the scene tree to false.This unpauses
## all nodes whose [member Node.process_mode] is set to 
## [constant Node.PROCESS_MODE_PAUSABLE].
func resume_game() -> void:
	get_tree().paused = false

## Manages the quit game process.
func quit_game() -> void:
	get_tree().quit()
