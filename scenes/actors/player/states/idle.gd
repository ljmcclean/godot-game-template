extends PlayerState

@export var fall_state: State
@export var jump_state: State
@export var move_state: State


func enter() -> void:
	super()
	player.velocity.x = 0


func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("up") and player.is_grounded():
		state_machine.change_state(jump_state)


func physics_update(delta: float) -> void:
	player.velocity.y += player.gravity*delta
	player.move_and_slide()
	
	if !player.is_grounded():
		state_machine.change_state(fall_state)
	elif player.get_input_vector().x != 0:
		state_machine.change_state(move_state)
