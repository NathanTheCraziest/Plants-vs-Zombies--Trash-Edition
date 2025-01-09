extends Button

@export var cooldown: float = 10.0
@export var init_cooldown: float = 0
@export var instant: bool = false
@export var this_plant: String = "sunflower"
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.one_shot = true
	%Board.planted.connect(on_planted)
	if not instant and init_cooldown == 0:
		timer.start(cooldown)
	elif init_cooldown != 0:
		timer.start(init_cooldown)


func _process(delta: float) -> void:
	if timer.is_stopped():
		progress_bar.visible = false
		disabled = false
	else:
		disabled = true
		progress_bar.visible = true
		progress_bar.max_value = timer.wait_time
		progress_bar.value = timer.time_left


func on_planted(plant: String):
	if plant == this_plant:
		timer.start(cooldown)
