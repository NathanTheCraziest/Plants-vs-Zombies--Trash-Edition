extends Node

var is_selecting: bool = false


func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("select"):
		is_selecting = true
	
	if event.is_action_released("select"):
		is_selecting = false
