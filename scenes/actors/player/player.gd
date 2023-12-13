class_name Player
extends CharacterBody2D

var gravity : float = 15000.0
var jump_gravity : float = 8500.0
var acceleration : float = 10000.0
var friction : float = 25000.0
var air_acceleration : float = 9900.0
var air_friction : float = 24000.0
var h_speed : float = 3000.0
var v_speed : float = 3000.0
var jump_impulse : float = 3000.0

@onready var animator : AnimatedSprite2D = $Animator
@onready var state_machine : Node = $StateMachine


func _ready() -> void:
	state_machine.initialize()


func _unhandled_input(event) -> void:
	state_machine.handle_input(event)


func _physics_process(delta) -> void:
	state_machine.physics_update(delta)


func _process(delta) -> void:
	state_machine.update(delta)


func get_input_vector() -> Vector2:
	var input_vector : Vector2 = Vector2(
		Input.get_action_raw_strength("right") - Input.get_action_raw_strength("left"),
		Input.get_action_raw_strength("down") - Input.get_action_raw_strength("up"))
	return input_vector

#TODO find most efficient way to ground check
func is_grounded() -> bool:
	for cast in $GroundCasts.get_children():
		if cast.is_colliding():
			return true
	return false
