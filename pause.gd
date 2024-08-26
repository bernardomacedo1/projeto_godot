extends CanvasLayer
@onready var level = $".."
@onready var pause = $"."

var game_paused = false

func _ready():
	visible = false


func _on_bt_sair_pressed():
	get_tree().quit()
	print("sair")
	
func _on_bt_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Level.tscn")
	print("Restart")
	

func _on_bt_voltar_pressed():
	get_tree().paused = false
	visible = false
	print("voltar")
	
func _unhandled_input(event):
		if event.is_action_pressed("pause"):
			game_paused = !game_paused
			get_tree().paused = game_paused
			visible= game_paused
			
