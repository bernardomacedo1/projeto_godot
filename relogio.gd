extends Area2D

@onready var control = $"../hud/Control"


func _on_body_entered(body):
	
	if body.name == "Player":
		control.segundos += 5
		await $CollisionShape2D.call_deferred("queue_free") # dentro do relógio soma seg
		# print(Global.timer_count.text)
		$AnimatedSprite2D.play("coletado")
		await $AnimatedSprite2D.animation_finished
		queue_free() #tirar da cena
