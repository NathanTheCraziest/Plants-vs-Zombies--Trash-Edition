extends TileMapLayer

class_name PlantBoard

@onready var plant_selector: PlantSelector = %PlantSelector

var selecting: String
var cost: int
signal planted(plant: String)

func _process(delta: float) -> void:
	var tile_position: Vector2i = local_to_map(get_local_mouse_position())
	var tile_data: TileData = get_cell_tile_data(tile_position)
	
	if tile_data != null and GameManager.get_plant(tile_position) == null and not selecting.is_empty() and cost <= GameManager.currrent_suns:
		GameManager.plant_preview.position = map_to_local(tile_position) + position
		GameManager.plant_preview.visible = true
		
		if Input.is_action_just_pressed("select"):
			var new_plant: Plant
			
			match(selecting):
				"sunflower":
					new_plant = Plants.sunflower.instantiate()
					planted.emit("sunflower")
				"peashooter":
					new_plant = Plants.peashooter.instantiate()
					planted.emit("peashooter")
				"wallnut":
					new_plant = Plants.wallnut.instantiate()
					planted.emit("wallnut")
				"potato_mine":
					new_plant = Plants.potato_mine.instantiate()
					planted.emit("potato_mine")
			
			new_plant.position = GameManager.plant_preview.position
			new_plant.tile_pos = tile_position
			GameManager.add_plant(new_plant, tile_position)
			get_parent().add_child(new_plant)
			
			selecting = ""
			plant_selector.hide_selector()
			GameManager.currrent_suns -= cost
			cost = 0
	else:
		GameManager.plant_preview.visible = false
