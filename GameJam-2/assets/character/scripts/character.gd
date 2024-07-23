class_name Player extends CharacterBody2D

var move_speed : float = 100.0
var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var state : String = "idle"

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite_2d : Sprite2D = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	velocity = direction * move_speed
	UpdateAnimation()
	pass


func _physics_process(delta):
	move_and_slide()
	
	
func SetDirection() -> bool:
	
	return true
	
func SetState() -> bool:
	
	return true

func UpdateAnimation() -> void:
	animation_player.play( state + "_" + "down")
	pass
	
func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "UP"
	else:
		return "side"

