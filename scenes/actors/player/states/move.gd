extends PlayerState

@export var fall_state: State
@export var jump_state: State
@export var idle_state: State


func enter() -> void:
	super()


func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("up") and player.is_grounded():
		state_machine.change_state(jump_state)


func physics_update(delta: float) -> void:
	player.velocity.y += player.gravity*delta
	if (player.get_input_vector().x != 0) and (player.velocity.x*player.get_input_vector().x > 0):
		player.velocity.x += player.get_input_vector().x*player.acceleration*delta
	elif player.get_input_vector().x != 0:
		player.velocity.x += player.get_input_vector().x*player.friction*delta
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.friction*delta)
	player.velocity.x = clamp(player.velocity.x, -player.h_speed, player.h_speed)
	player.move_and_slide()
	
	if player.velocity.y > 0:
		state_machine.change_state(fall_state)
	elif is_zero_approx(player.velocity.x):
		state_machine.change_state(idle_state)
