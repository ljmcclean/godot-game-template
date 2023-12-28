class_name LoadingScreen
extends Control
## Scene used as transition while target scene is loaded in a seperate thread.
##
## Utilizes Godot's built-in [ResourceLoader] to handle the loading of
## the target scene in a seperate thread. This scene is integrated with
## [DocsSceneManager] through [method DocsSceneManager.load_scene].

## The scene to be loaded. This is assigned at [method _ready] to the target
## scene declared at [member DocsSceneManager.load_scene_path].
var target_scene_path: StringName
## The current load status of the scene as returned by the [ResourceLoader].
var loading_status: int
## The progress current progress percentage as returned by the [ResourceLoader].
var progress: Array[float]

## Assigned by [annotation @GDScript.@onready] to the scene's child [ProgressBar].
@onready var progress_bar: ProgressBar = $ProgressBar


func _ready() -> void:
	target_scene_path = Scenes.load_scene_path
	ResourceLoader.load_threaded_request(target_scene_path)


func _process(_delta: float) -> void:
	loading_status = ResourceLoader.load_threaded_get_status(target_scene_path, progress)
	
	match loading_status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			progress_bar.value = progress[0] * 100
		ResourceLoader.THREAD_LOAD_LOADED:
			get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(target_scene_path))
		ResourceLoader.THREAD_LOAD_FAILED:
			print("Error. Could not load " + target_scene_path + "\n" + str(loading_status))
