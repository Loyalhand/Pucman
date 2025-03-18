extends CharacterBody2D


const SPEED = 300.0
var move_left: bool = false
var move_right: bool = false
var move_up: bool = false
var move_down: bool = false

func _physics_process(delta):
	
	if Input.is_action_just_pressed("move_left"): 
		move_left = true
		move_right = false
		move_up = false
		move_down = false
	if Input.is_action_just_pressed("move_right"): 
		move_left = false
		move_right = true
		move_up = false
		move_down = false
	if Input.is_action_just_pressed("move_up"): 
		move_left = false
		move_right = false
		move_up = true
		move_down = false
	if Input.is_action_just_pressed("move_down"): 
		move_left = false
		move_right = false
		move_up = false
		move_down = true
	
	if move_left: 
		position.x -= SPEED * delta
	if move_right: 
		position.x += SPEED * delta
	if move_up: 
		position.y -= SPEED * delta
	if move_down: 
		position.y += SPEED * delta
