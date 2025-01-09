extends Node

var plant_preview: PlantPreview

var board: Dictionary
var sun_fly_pos: Vector2 = Vector2(-664, -406)
var currrent_suns: int = 150

func get_plant(tile_position: Vector2i):
	return board.get(tile_position)


func add_plant(new_plant: Plant, tile_position: Vector2i):
	board.get_or_add(tile_position, new_plant)


func remove_plant(tile_position: Vector2i):
	board.erase(tile_position)
