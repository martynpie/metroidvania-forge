class_name Player extends CharacterBody2D

#region /// State Machine Variables
var states : Array[ PlayerState ]
var current_state : PlayerState : 
	get : return states.front() #dot front returns the first element of the array
var previous_state : PlayerState :
	get : return states[ 1 ] #returns the state in array position 2 (obvs posn 1 is index zero)
#endregion

#region /// standard variables
var direction : Vector2 = Vector2.ZERO
var gravity : float = 981
#endregion


func _ready() -> void:
	#initialise states
	initialise_states()
	pass


func _unhandled_input(event: InputEvent) -> void:
	change_state( current_state.handle_input( event ) )


func _process( _delta : float ) -> void:
	update_direction()
	change_state( current_state.process( _delta ) )
	pass


func _physics_process( _delta : float ) -> void:
	velocity.y += gravity * _delta
	move_and_slide()
	change_state( current_state.physics_process( _delta ) )
	pass


func initialise_states() -> void:
	states = []
	#gather all the states
	for c in $States.get_children():
		if c is PlayerState:
			states.append( c )
			c.player = self #refers to the class name of this script, i.e. Player
		pass
	
	if states.size() == 0:
		print("no states detected")
		return #this would break the function early if there were no states - otherwise setting the first state would bug the game out
	
	
	#initialise all the states
	for state in states:
		state.init() #calls the init function in the state script
	
	#set our first state
	change_state( current_state )
	current_state.enter()
	pass


func change_state( new_state : PlayerState ) -> void:
	if new_state == null:
		return
	elif new_state == current_state:
		return
	
	if current_state: #short for "if current state is a valid state", so we can proceed to exit and change to next state
		current_state.exit()
	
	states.push_front( new_state ) #push front is a sausage machine function for arrays, putting the new state to the front and shunting everything else to suit
	current_state.enter()
	states.resize( 3 ) #keeps the size of the states array at 3, so we're not just adding thousands of states
	pass


func update_direction() -> void:
	#var prev_direction : Vector2 = direction
	direction = Input.get_vector( "left" , "right" , "up" , "down" )
	
	#do more stuff later
	pass
