class_name PlayerStateCrouch extends PlayerState

@export var decelleration_rate : float = 10

var dropping_through : bool = false
var drop_timer : float = 0.1

#What happens when this state is initialised?
func init() -> void:
	pass

#What happens when we enter this state?
func enter() -> void:
	#Play crouch tranistion animation
	player.collision_stand.disabled = true
	player.collision_crouch.disabled = false
	player.sprite.scale.y = 0.625
	player.sprite.position.y = -15
	#Play crouch idle animation?
	#Shrink hitbox
	
	pass

#What happens when we exit this state?
func exit() -> void:
	player.collision_stand.disabled = false
	player.collision_crouch.disabled = true
	player.sprite.scale.y = 1.0
	player.sprite.position.y = -24
	pass

#What happens when an input is pressed?
func handle_input( _event : InputEvent ) -> PlayerState:
	if _event.is_action_released( "down" ):
		return idle
	if _event.is_action_pressed( "jump" ):
		if player.one_way_platform_raycast.is_colliding() == true:
			player.position.y +=4
			return fall
		else:
			return jump
		return fall
	return next_state

#What happens each process tick in this state?
func process( _delta: float ) -> PlayerState:
	return next_state

#What happens each physics_process tick in this state?
func physics_process( _delta: float ) -> PlayerState:
	player.velocity.x -= player.velocity.x * decelleration_rate * _delta
	
	if player.is_on_floor() == false:
		return fall
	return next_state
