extends Area2D

var ponto = 1
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
		if body.name == "Player":
		Global.somaPontos += ponto
		print(Global.somaPontos)
		$AnimatedSprite2D.play("coletad")
		await $AnimatedSprite2D.animation_finished
		queue_free() #tirar da cena
