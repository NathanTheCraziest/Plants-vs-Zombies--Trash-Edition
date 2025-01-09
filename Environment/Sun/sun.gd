extends Area2D

var is_falling: bool = true

var land_position: float
var is_collected: bool = false

@onready var despawn_timer: Timer = $DespawnTimer
@onready var sprite_2d: Sprite2D = $Sprite2D


func _process(delta: float) -> void:
	
	sprite_2d.rotation += 1 * delta
	
	if not is_collected:
		if is_falling and position.y < land_position:
			position.y += 50 * delta
		elif despawn_timer.is_stopped():
			despawn_timer.start()
	else:
		position = position.lerp(GameManager.sun_fly_pos, delta * 7)
		scale = scale.lerp(Vector2(0.8, 0.8), delta * 7)
		if position.distance_to(GameManager.sun_fly_pos) < 1:
			queue_free()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if PlayerInput.is_selecting and not is_collected:
		is_collected = true
		GameManager.currrent_suns += 25


func _on_despawn_timer_timeout() -> void:
	queue_free()
