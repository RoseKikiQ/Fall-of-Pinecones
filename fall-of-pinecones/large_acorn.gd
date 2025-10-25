extends Area2D

var fall_speed2 = 1000        
var rotating2 = 30    
var moving_speed2 = 2         
var time_passed2 = 0         

func _physics_process(delta):
	time_passed2 += delta
	position.y += fall_speed2 * delta
	position.x += sin(time_passed2 * moving_speed2) * rotating2 * delta
	rotation += 0.5 * delta
	var screen_height = get_viewport().get_visible_rect().size.y
	if position.y > screen_height + 50:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Squirrel":
		queue_free()
