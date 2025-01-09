extends Plant


const sun_scene: PackedScene = preload("res://Environment/Sun/sun.tscn")


func _on_timer_timeout() -> void:
	$AnimationPlayer.play("spawn_sun")
	$Timer.start(randf_range(8, 13))


func idle_anim():
	$AnimationPlayer.play("idle")


func spawn_random_sun():
	
	var sun_copy: Node2D = sun_scene.instantiate()
	
	sun_copy.position = global_position
	sun_copy.position.x += randf_range(-35, 35)
	sun_copy.land_position += randf_range(-35, 0)
	sun_copy.land_position = position.y + 35
	
	get_parent().add_child(sun_copy)
