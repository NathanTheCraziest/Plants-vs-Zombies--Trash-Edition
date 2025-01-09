extends Area2D

class_name Zombie

@export var health: int = 8
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var eat_timer: Timer = $EatTimer

var target: Plant
var was_eating: bool = false

func _process(delta: float) -> void:
	var hit = ray_cast_2d.get_collider()
	
	if hit is Plant:
		target = hit
		
		if eat_timer.is_stopped():
			hit.hurt()
			eat_timer.start()
		
		animation_player.play("eat")
		was_eating = true
	else:
		
		eat_timer.stop()
		target = null
		
		if was_eating:
			animation_player.play("RESET")
			was_eating = false
		else:
			animation_player.play("walk")
			position.x -= 30 * delta
	
	if position.x <= -780:
		%LoseScreen.visible = true
		get_tree().paused = true

func _on_eat_timer_timeout() -> void:
	target.hurt()


func _on_body_entered(body: Node2D) -> void:
	if body is Pea:
		hurt()
		body.queue_free()


func hurt():
	health -= 1
	if health <= 0:
		die()


func die():
	$CollisionShape2D.set_deferred("disabled", false)
	queue_free()
