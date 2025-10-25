extends CharacterBody2D

@export var speed = 750.0
@onready var animations = $AnimationPlayer
@onready var Point_label = %Label
var Point_counter = 0

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
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Leaf"):
		set_points(Point_counter + 1)
		print(Point_counter)
	if area.is_in_group("Acorn"):
		set_points(Point_counter + 5)
		print(Point_counter)
	if area.is_in_group("LargeAcorn"):
		set_points(Point_counter + 10)
		print(Point_counter)

func set_points(new_point_count:int) -> void:
	Point_counter = new_point_count
	Point_label.text = "Point Counts: " + str(Point_counter) + "/500"
	if Point_counter >= 500:
		get_tree().change_scene_to_file("res://Ending.tscn")
