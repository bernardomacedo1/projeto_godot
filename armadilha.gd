extends Area2D


@onready var player = $"../../Player"


func _on_body_entered(body):
	if body.name == "Player":
		print("Morreu?")
		player._levouDano(3)
		
		get_tree().reload_current_scene()
		
	
	
