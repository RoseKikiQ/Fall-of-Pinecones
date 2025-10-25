extends Area2D

var fall_speed = 100        
var rotating = 30    
var moving_speed = 2         
var time_passed = 0         

func _physics_process(delta):
	time_passed += delta
	position.y += fall_speed * delta
	position.x += sin(time_passed * moving_speed) * rotating * delta
	rotation += 0.5 * delta
	var screen_height = get_viewport().get_visible_rect().size.y
	if position.y > screen_height + 50:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Squirrel":
		queue_free()
