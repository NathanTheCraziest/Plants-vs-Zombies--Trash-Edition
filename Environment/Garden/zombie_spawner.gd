extends Node2D

@onready var board: PlantBoard = %Board
const zombie_scene: PackedScene = preload("res://Zombies/zombie.tscn")
@onready var wave_timer: Timer = $WaveTimer
@onready var small_timer: Timer = $SmallTimer


func _process(delta: float) -> void:
	pass


func spawn_zombie(pos: int = -1):
	var new_zombie = zombie_scene.instantiate()
	
	if pos < 0:
		new_zombie.position = get_spawn_pos(randi_range(-3, 1))
	else:
		new_zombie.position = get_spawn_pos(pos - 3)
	get_parent().call_deferred("add_child", new_zombie)


func get_spawn_pos(lane_no: int):
	var pos = board.map_to_local(Vector2i(0, lane_no))
	pos.x = position.x
	pos.y += 35
	return pos

var small_spawns: int = 0

func _on_small_timer_timeout() -> void:
	small_spawns += 1
	
	spawn_zombie()
	
	for i in roundi(small_spawns - small_spawns * 0.5):
		await get_tree().create_timer(randf_range(1.0, 3.0)).timeout
		spawn_zombie()
	wave_timer.start(randi_range(5, clampf(15 - 0.25 * small_spawns, 7, 15)))


var wave_spawns: int = 0
func _on_wave_timer_timeout() -> void:
	wave_spawns += 1
	for i in randi_range(3, 5) + wave_spawns:
		await get_tree().create_timer(randf_range(1.0, 2.0)).timeout
		spawn_zombie()
	wave_timer.start(randi_range(30, clampf(60 - 0.25 * small_spawns, 31, 60)))
