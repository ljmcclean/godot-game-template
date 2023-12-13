extends Control

var target_scene_path : StringName
var loading_status : int
var progress : Array[float]

@onready var progress_bar : ProgressBar = $ProgressBar


func _ready() -> void:
	target_scene_path = SceneManager.load_scene_path
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
