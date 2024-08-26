extends Area2D

var ponto = 1

func _on_body_entered(body):
	if body.name == "Player":
		Global.somaPontos += ponto
		print(Global.somaPontos)
		$AnimatedSprite2D.play("coletado")
		await $AnimatedSprite2D.animation_finished
		queue_free() #tirar da cena
	 


