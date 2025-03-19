extends CharacterBody2D

class_name Player

#variables
var next_movement_direction = Vector2.ZERO
var movement_direction = Vector2.ZERO
var shape_query = PhysicsShapeQueryParameters2D.new()

#export variables
@export var speed = 300


#onready variables
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	shape_query.shape = collision_shape_2d.shape
	shape_query.collision_mask = 2

func _physics_process(delta):
	get_input()
	
	if movement_direction == Vector2.ZERO:
		movement_direction = next_movement_direction
		
	if can_move_in_direction(next_movement_direction, delta):
		movement_direction = next_movement_direction
	
	velocity = movement_direction * speed
	move_and_slide()
	

func get_input():
	
	if Input.is_action_pressed("move_left"):
		next_movement_direction = Vector2.LEFT
		rotation_degrees = 180
	elif  Input.is_action_pressed("move_right"):
		next_movement_direction = Vector2.RIGHT
		rotation_degrees = 0
	elif Input.is_action_pressed("move_down"):
		next_movement_direction = Vector2.DOWN
		rotation_degrees = 90
	elif Input.is_action_pressed("move_up"):
		next_movement_direction = Vector2.UP
		rotation_degrees = 270

# creates a raycast of its collision shape in the direction of next input and 
# returns true if no collidables are in the shape
func can_move_in_direction(dir: Vector2, delta: float) -> bool:
	shape_query.transform = global_transform.translated(dir * speed * delta * 2)
	var result = get_world_2d().direct_space_state.intersect_shape(shape_query)
	if result:
		print("Hit at point: ", result)
	return result.size() == 0	

	
