extends CharacterBody2D


const SPEED = 300.0
var move_left: bool = false
var move_right: bool = false
var move_up: bool = false
var move_down: bool = false

var last_input = null
var last_pos = null

var move_input := Vector2i.ZERO

func _physics_process(delta):
	
	var direction = Vector2i.ZERO
	direction.x = (Input.get_axis("move_left", "move_right"))
	direction.y = (Input.get_axis("move_up", "move_down"))
	
	if direction.x != 0:
		move_input = Vector2(direction.x, 0)
	elif direction.y != 0:
		move_input = Vector2(0, direction.y)
	
	velocity = SPEED * move_input	
	move_and_slide()
	print(move_input)
