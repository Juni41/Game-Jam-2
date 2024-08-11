class_name State extends Node

#stores a reference this state belongs to
static var player: Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body

#when player enters this state
func Enter() -> void:
	pass

#when player exits this state
func Exit() -> void:
	pass

#what happens during the procces update in this state
func Process(_delta : float) -> State:
	return null

#what happens during the physics process update during this state
func Physics(_delta : float ) -> State:
	return null

	#what happens with input events in this state
func HandleInput( _event :InputEvent ) -> State:
	return null
	
