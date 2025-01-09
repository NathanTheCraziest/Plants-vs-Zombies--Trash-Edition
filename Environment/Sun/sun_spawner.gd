extends Node2D

const sun_scene: PackedScene = preload("res://Environment/Sun/sun.tscn")


func _on_timer_timeout() -> void:
	spawn_random_sun()


func spawn_random_sun():
	
	var sun_copy: Node2D = sun_scene.instantiate()
	
	sun_copy.position.x = randf_range($MinPos.position.x, $MaxPos.position.x)
	sun_copy.position.y = position.y
	sun_copy.land_position = randf_range($MinFall.global_position.y, $MaxFall.global_position.y)
	
	get_parent().add_child(sun_copy)
