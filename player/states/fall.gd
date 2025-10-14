class_name PlayerStateFall extends PlayerState

#What happens when this state is initialised?
func init() -> void:
	pass

#What happens when we enter this state?
func enter() -> void:
	#Play jump animation
	pass

#What happens when we exit this state?
func exit() -> void:
	pass

#What happens when an input is pressed?
func handle_input( _event : InputEvent ) -> PlayerState:

	return next_state

#What happens each process tick in this state?
func process( _delta: float ) -> PlayerState:

	return next_state

#What happens each physics_process tick in this state?
func physics_process( _delta: float ) -> PlayerState:
	if player.is_on_floor():
		player.add_debug_indicator(Color.BURLYWOOD)
		return idle
	player.velocity.x = player.direction.x * player.move_speed * player.jump_speed_modifier
	return next_state
