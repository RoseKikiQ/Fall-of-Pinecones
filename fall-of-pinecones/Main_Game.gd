extends Node

@onready var leaf_scene1 = preload("res://Maple_leaf.tscn")
@onready var leaf_scene2 = preload("res://leaf.tscn")
@onready var small_acorn = preload("res://small_acorn.tscn")
@onready var large_acorn = preload("res://large_acorn.tscn")

func _ready():
	randomize()
	_spawn_timer("_spawn_leaf1", 1)      
	_spawn_timer("_spawn_leaf2", 1)      
	_spawn_timer("_spawn_small_acorn", 5)  
	_spawn_timer("_spawn_large_acorn", 10)  


func _spawn_timer(function_name: String, time):
	var timer = Timer.new()
	timer.wait_time = time
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(Callable(self, function_name))

func _spawn_leaf1():
	var leaf = leaf_scene1.instantiate()
	var screen_rect = get_viewport().get_visible_rect()
	leaf.position.y = screen_rect.position.y - 30
	leaf.position.x = randf_range(screen_rect.position.x, screen_rect.size.x)
	add_child(leaf)

func _spawn_leaf2():
	var leaf2 = leaf_scene2.instantiate()
	var screen_rect2 = get_viewport().get_visible_rect()
	leaf2.position.y = screen_rect2.position.y - 30
	leaf2.position.x = randf_range(screen_rect2.position.x, screen_rect2.size.x)
	add_child(leaf2)

func _spawn_small_acorn():
	var smallacorn = small_acorn.instantiate()
	var Sscreen_rect = get_viewport().get_visible_rect()
	smallacorn.position.y = Sscreen_rect.position.y - 30
	smallacorn.position.x = randf_range(Sscreen_rect.position.x, Sscreen_rect.size.x)
	add_child(smallacorn)

func _spawn_large_acorn():
	var Lscreen_rect = get_viewport().get_visible_rect()
	var largeacorn = large_acorn.instantiate()
	largeacorn.position.y = Lscreen_rect.position.y - 30
	largeacorn.position.x = randf_range(Lscreen_rect.position.x, Lscreen_rect.size.x)
	add_child(largeacorn)
