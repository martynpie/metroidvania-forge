class_name PlayerStateJump extends PlayerState

@export var jump_velocity : float = 450.0


#What happens when this state is initialised?
func init() -> void:
	pass

#What happens when we enter this state?
func enter() -> void:
#play animation
	player.animation_player.play( "jump" )
	player.add_debug_indicator(Color.LIME_GREEN)
	player.velocity.y = -jump_velocity
	pass

#What happens when we exit this state?
func exit() -> void:
	player.add_debug_indicator(Color.BLUE_VIOLET)
	pass

#What happens when an input is pressed?
func handle_input( event : InputEvent ) -> PlayerState:
	if event.is_action_released( "jump" ):
		player.velocity.y *= 0.35
		return fall
	if event.is_action_pressed( "dash" ):
		return dash
	return next_state

#What happens each process tick in this state?
func process( _delta: float ) -> PlayerState:

	return next_state

#What happens each physics_process tick in this state?
func physics_process( _delta: float ) -> PlayerState:
	if player.is_on_floor():
		return idle
	elif player.velocity.y >= 0:
		return fall
	player.velocity.x = player.direction.x * player.move_speed * player.jump_speed_modifier
	return next_state
