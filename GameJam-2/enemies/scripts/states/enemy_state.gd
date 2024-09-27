class_name EnemyState extends Node

## stores a reference to an enemy that this state belongs to
var enemy : Enemy
var state_machine : EnemyStateMachine
# Called when the node enters the scene tree for the first time.

func init() -> void:
	pass
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass

func process( _delta : float ) -> EnemyState:
	return null
	
func physics( _delta : float ) -> EnemyState:
	return null

