extends StaticBody2D

class_name Plant

var tile_pos: Vector2i
@export var health: int = 10


func hurt(damage: int = 1):
	hit_flash()
	health -= damage
	if health <= 0:
		die()


func die():
	GameManager.remove_plant(tile_pos)
	queue_free()


func hit_flash():
	$Sprite2D.material.set_shader_parameter("active", true)
	await get_tree().create_timer(0.2).timeout
	$Sprite2D.material.set_shader_parameter("active", false)
