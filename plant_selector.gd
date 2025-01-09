extends HBoxContainer

class_name PlantSelector

@onready var selector: TextureRect = $"../Selector"
@onready var sunflower: Button = $Sunflower
@onready var peashooter: Button = $Peashooter
@onready var wallnut: Button = $Wallnut
@onready var potato_mine: Button = $PotatoMine
@onready var plant_board: PlantBoard = %Board


func _on_sunflower_button_down() -> void:
	selector.position = sunflower.global_position
	selector.visible = true
	plant_board.selecting = "sunflower"
	plant_board.cost = 50


func _on_peashooter_button_down() -> void:
	selector.position = peashooter.global_position
	selector.visible = true
	plant_board.selecting = "peashooter"
	plant_board.cost = 100


func _on_wallnut_button_down() -> void:
	selector.position = wallnut.global_position
	selector.visible = true
	plant_board.selecting = "wallnut"
	plant_board.cost = 50


func _on_potato_mine_button_down() -> void:
	selector.position = potato_mine.global_position
	selector.visible = true
	plant_board.selecting = "potato_mine"
	plant_board.cost = 25


func hide_selector():
	selector.hide()
