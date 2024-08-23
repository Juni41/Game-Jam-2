class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO


@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite_2d : Sprite2D = $Sprite2D
@onready var state_machine : PlayerStateMachine = $StateMachine

func _ready():
	state_machine.Initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	direction = direction.normalized()

	pass


func _physics_process(delta):
	move_and_slide()
	
	
func SetDirection() -> bool:
	var new_dir: Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		new_dir = Vector2.RIGHT if direction.x > 0 else Vector2.LEFT
	elif direction.x == 0:
		new_dir = Vector2.DOWN if direction.y > 0 else Vector2.UP
		
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	sprite_2d.scale.x = 1 if cardinal_direction == Vector2.RIGHT else -1
	return true


func UpdateAnimation(state: String) -> void:
	var anim_direction = AnimDirection()
	animation_player.play(state + "_" + anim_direction)


func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

