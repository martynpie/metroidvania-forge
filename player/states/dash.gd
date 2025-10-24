class_name PlayerStateDash extends PlayerState

@export var dash_cooldown : float = 0.3
@export var dash_velocity : int = 1000

#What happens when this state is initialised?
func init() -> void:
	pass

#What happens when we enter this state?
func enter() -> void:
	#Play dash animation
	player.velocity.x = dash_velocity
	pass

#What happens when we exit this state?
func exit() -> void:
	pass

#What happens when an input is pressed?
func handle_input( _event : InputEvent ) -> PlayerState:
	return next_state

#What happens each process tick in this state?
func process( _delta: float ) -> PlayerState:
	if player.direction.x != 0:
		return run
	
	return next_state

#What happens each physics_process tick in this state?
func physics_process( _delta: float ) -> PlayerState:
	player.velocity.x = 0
	if player.is_on_floor() == false:
		return fall
	return next_state
