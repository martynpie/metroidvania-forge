class_name PlayerStateFall extends PlayerState

@export var coyote_time : float = 0.3 #Homework
var coyote_timer : float = 0.0
var coyote_counter : int = 0

#What happens when this state is initialised?
func init() -> void:
	
	pass

#What happens when we enter this state?
func enter() -> void:
	#Play fall animation
	coyote_timer = coyote_time #Homework
	pass

#What happens when we exit this state?
func exit() -> void:
	pass

#What happens when an input is pressed?
func handle_input( _event : InputEvent ) -> PlayerState:
	if coyote_timer > 0: #Homework
		if _event.is_action_pressed( "jump" ) and coyote_counter > 0: #Homework
			coyote_counter = 0 #Homework
			return jump 
	return next_state

#What happens each process tick in this state?
func process( _delta: float ) -> PlayerState:

	return next_state

#What happens each physics_process tick in this state?
func physics_process( _delta: float ) -> PlayerState:
	if player.is_on_floor():
		coyote_timer = coyote_time #Homework - reset coyote timer
		player.add_debug_indicator(Color.BURLYWOOD)
		return idle
	player.velocity.x = player.direction.x * player.move_speed * player.jump_speed_modifier
	if coyote_timer > 0: #Homework
		coyote_timer -= _delta #Homework
	
	
	return next_state
