extends PlayerState

@export var idle_state : State
@export var jump_state : State
@export var move_state : State


func enter() -> void:
	super()


func handle_input(_event : InputEvent) -> void:
	pass


func physics_update(delta : float) -> void:
	player.velocity.y += player.gravity*delta
	if (player.get_input_vector().x != 0) and (player.velocity.x*player.get_input_vector().x > 0):
		player.velocity.x += player.get_input_vector().x*player.air_acceleration*delta
	elif player.get_input_vector().x != 0:
		player.velocity.x += player.get_input_vector().x*player.air_friction*delta
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.air_friction*delta)
	player.velocity.x = clamp(player.velocity.x, -player.h_speed, player.h_speed)
	player.velocity.y = clamp(player.velocity.y, -player.v_speed, player.v_speed)
	player.move_and_slide()
	
	if player.is_grounded() and !is_zero_approx(player.velocity.x):
		state_machine.change_state(move_state)
	elif player.is_grounded():
		state_machine.change_state(idle_state)

func debug() -> void:
	player.modulate = Color(1, 0, 0, 1)
