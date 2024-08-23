class_name State_Walk extends State

@export var move_speed : float = 100.0
@onready var idle : State = $"../Idle"
@onready var attack : State = $"../Attack"
#when player enters this state
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

#when player exits this state
func Exit() -> void:
	pass

#what happens during the procces update in this state
func Process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null

#what happens during the physics process update during this state
func Physics(_delta : float ) -> State:
	return null

	#what happens with input events in this state
func HandleInput( _event :InputEvent ) -> State:
	if _event.is_action_pressed("Attack"):
		return attack
	return null
	
