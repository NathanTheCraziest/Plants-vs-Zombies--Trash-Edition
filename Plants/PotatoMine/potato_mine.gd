extends Plant

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var area_2d: Area2D = $Area2D

var primed: bool = false


func _on_priming_time_timeout() -> void:
	animation_player.play("prime")
	await animation_player.animation_finished
	animation_player.play("idle")
	primed = true


func hurt(damage: int = 1):
	if primed:
		explode()
	super(damage)


func explode():
	var hits = area_2d.get_overlapping_areas()
	
	animation_player.play("explode")
	for hit in hits:
		if hit is Zombie:
			hit.die()
	await animation_player.animation_finished
	queue_free()
