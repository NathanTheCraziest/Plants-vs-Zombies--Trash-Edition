extends Area2D


func _on_mouse_entered() -> void:
	GameManager.plant_preview.position = global_position
	GameManager.plant_preview.visible = true


func _on_mouse_exited() -> void:
	pass
	#GameManager.plant_preview.visible = false
