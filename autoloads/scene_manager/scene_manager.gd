extends Node
## Used for managing, loading, removing, and switching scenes.

## Scene aliases are keyed to PackedScene objects.
var scenes_packed : Dictionary = {
	"main_scene": preload("res://scenes/main/main.tscn"),
	"main_menu": preload("res://scenes/menus/main_menu/main_menu.tscn"),
	"settings_menu": preload("res://scenes/menus/settings_menu/settings_menu.tscn"),
	"loading_screen": preload("res://scenes/menus/loading_screen/loading_screen.tscn"),
	"world": preload("res://scenes/world/world.tscn")
}

## Scene aliases are keyed to String scene paths.
var scenes_path: Dictionary = {
	"main_scene": "res://scenes/main/main.tscn",
	"main_menu": "res://scenes/menus/main_menu/main_menu.tscn",
	"settings_menu": "res://scenes/menus/settings_menu/settings_menu.tscn",
	"loading_screen": "res://scenes/menus/loading_screen/loading_screen.tscn",
	"world": "res://scenes/world/world.tscn"
}

## The alias for the currently active scene.
var current_scene_alias : String = ""
## The path for the scene to be loaded (used by load_scene()).
var load_scene_path : StringName


func _ready() -> void:
	current_scene_alias = "main_scene"

## Adds a scene to scenes_packed and scenes_path.
func add_scene(scene_alias : String, scene_path : String) -> void:
	scenes_packed[scene_alias] = load(scene_path)
	scenes_path[scene_alias] = scene_path

## Removes a scene from scenes_packed and scenes_path.
func remove_scene(scene_alias : String) -> void:
	scenes_packed.erase(scene_alias)
	scenes_path.erase(scene_alias)

## Replaces the tree with the new scene.
func switch_scene(scene_alias : String) -> void:
	get_tree().change_scene_to_packed(scenes_packed[scene_alias])
	current_scene_alias = scene_alias

## Replaces tree with "loading_screen" and loads new scene.
func load_scene(scene_alias : String) -> void:
	load_scene_path = scenes_path[scene_alias]
	get_tree().change_scene_to_packed.call_deferred(scenes_packed["loading_screen"])
	current_scene_alias = scene_alias

## Additively loads the new scene.
func add_scene_to_tree(scene_alias : String) -> void:
	var new_scene = scenes_packed[scene_alias].instantiate()
	get_tree().root.add_child.call_deferred(new_scene)

## Restarts the scene.
func restart_scene() -> void:
	get_tree().reload_current_scene()

## Quits game.
func quit_game() -> void:
	get_tree().quit()
