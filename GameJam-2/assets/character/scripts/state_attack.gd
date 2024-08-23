extends State

var attacking : bool = false
@onready var walk : State = $"../Walk"
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var idle = $"../Idle"

# Called when the player enters this state
func Enter() -> void:
	player.UpdateAnimation("attack")
	animation_player.animation_finished.connect(self.EndAttack) 
	attacking = true

# Called when the player exits this state
func Exit() -> void:
	animation_player.animation_finished.disconnect(self.EndAttack)
	attacking = false
	pass

# What happens during the process update in this state
func Process(_delta : float) -> State:
	player.velocity = Vector2.ZERO
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null

# What happens during the physics process update during this state
func Physics(_delta : float ) -> State:
	return null

# What happens with input events in this state
func HandleInput( _event : InputEvent ) -> State:
	return null
	
# Ends the attack
func EndAttack() -> void:
	attacking = false
