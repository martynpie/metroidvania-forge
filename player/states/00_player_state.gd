#This script defines what a state needs to perform
@icon( "res://player/states/state.svg" )
class_name PlayerState extends Node

var player : Player #a variable that HAS to be of Class 'Player' - this is strict player 
var next_state : PlayerState

#region /// state references
@onready var run: PlayerStateRun = %Run
@onready var idle: PlayerStateIdle = %Idle
#endregion 

#What happens when this state is initialised?
func init() -> void:
	pass

#What happens when we enter this state?
func enter() -> void:
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
	
	return next_state
