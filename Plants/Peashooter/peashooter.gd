extends Plant

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var shoot_timer: Timer = $ShootTimer
@onready var shoot_point: Node2D = $ShootPoint
var pea_scene: PackedScene = preload("res://Plants/Peashooter/pea.tscn")


func _physics_process(delta: float) -> void:
	var hit = ray_cast_2d.get_collider()
	
	if hit is Zombie:
		if shoot_timer.is_stopped():
			await get_tree().create_timer(randf_range(0.5, 2.0))
			shoot_timer.start()
	else:
		shoot_timer.stop()


func shoot():
	animation_player.play("shoot")


func shoot_pea():
	var new_pea = pea_scene.instantiate()
	new_pea.position = shoot_point.global_position
	new_pea.position.y += randf_range(-0.5, 0.5)
	get_parent().add_child(new_pea)


func _on_shoot_timer_timeout() -> void:
	shoot()


func idle():
	animation_player.play("idle")
