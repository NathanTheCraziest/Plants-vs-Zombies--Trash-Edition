extends PanelContainer

func _process(delta: float) -> void:
	$Control/Label.text = var_to_str(GameManager.currrent_suns)
