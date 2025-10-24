extends CharacterBody2D

@export var speed = 500.0
@onready var animations = $AnimationPlayer

func handleInput():
	var direction_x = Input.get_axis("Left", "Right")
	velocity.x = direction_x * speed

func updateAnimation():
	var directions = "Down"
	if velocity.x < 0: directions = "left"
	if velocity.x > 0: directions = "right"
	
	animations.play("walk_" + directions)

func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
