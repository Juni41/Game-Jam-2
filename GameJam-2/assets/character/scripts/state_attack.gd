class_name  State_Attack extends State
var attacking : bool = false
@export var attack_sound : AudioStream
@export_range(1,20,0.5) var decelerate_speed : float = 5.0
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var audio : AudioStreamPlayer2D = $"../../Sound/AudioStreamPlayer2D"
@onready var idle : State = $"../Idle"
@onready var walk : State = $"../Walk"
@onready var hurt_box : HurtBox = $"../../Interactions/HurtBox"

#when player enters this state
func Enter() -> void:
	player.UpdateAnimation("attack")
	animation_player.animation_finished.connect( EndAttack )
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range( 0.9, 1.1 )
	audio.play()
	attacking = true
	
	await get_tree().create_timer( 0.0754 ).timeout
	hurt_box.monitoring = true
	pass

#when player exits this state
func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	hurt_box.monitoring = false
	pass

#what happens during the procces update in this state
func Process(_delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

#what happens during the physics process update during this state
func Physics(_delta : float ) -> State:
	return null

	#what happens with input events in this state
func HandleInput( _event :InputEvent ) -> State:
	return null
	
	
func EndAttack( _newAnimName : String ) -> void:
	attacking = false
