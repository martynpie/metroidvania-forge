class_name PlayerStateCrouch extends PlayerState


var dropping_through : bool = false
var drop_timer : float = 0.1

#What happens when this state is initialised?
func init() -> void:
	pass

#What happens when we enter this state?
func enter() -> void:
	#Play crouch tranistion animation
	#Play crouch idle animation?
	#Shrink hitbox
	player.collision_shape_2d.shape.size.y = 23
	player.collision_shape_2d.position.y += 12
	pass

#What happens when we exit this state?
func exit() -> void:
	player.collision_shape_2d.position.y -= 12
	player.collision_shape_2d.shape.size.y = 46
	pass

#What happens when an input is pressed?
func handle_input( _event : InputEvent ) -> PlayerState:
	if _event.is_action_released( "down" ):
		return idle
	if _event.is_action_pressed( "jump" ):
		print("am i on a one way plaftform?")
		if is_standing_on_one_way() == true:
			start_drop_through()
		return fall
	return next_state

#What happens each process tick in this state?
func process( _delta: float ) -> PlayerState:
	return next_state

#What happens each physics_process tick in this state?
func physics_process( _delta: float ) -> PlayerState:
	player.velocity.x = 0
	if player.is_on_floor() == true:
		if is_standing_on_one_way():
			print("Standing on a one-way platform")
		else:
			print("Standing on a solid platform")
	if player.is_on_floor() == false:
		return fall

	return next_state

#Lets sort out this collider nonsense

func is_standing_on_one_way() -> bool:
	var floor_collision = player.get_last_slide_collision()
	if floor_collision == null:
		return false
	var collider = floor_collision.get_collider()
	var shape_idx = floor_collision.get_collider_shape_index()
	return collider.is_shape_owner_one_way_collision_enabled(shape_idx)

#Drop through helping functions

func start_drop_through() -> void:
	dropping_through = true
	drop_timer = 0.1
	player.collision_shape_2d.disabled = true
	player.global_position.y += 2
	pass
