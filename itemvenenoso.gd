extends Area2D


@onready var player = $"../../Player"



func _on_body_entered(body):
	if body.name == "Player":
		print("encostou")
		player._levouDano(1)
		
		get_tree().reload_current_scene()
		
	
