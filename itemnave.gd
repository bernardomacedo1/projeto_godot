extends Area2D




#	if body.name == "Player":
		$AnimatedSprite2D.play("coletado")
		await $AnimatedSprite2D.animation_finished
		queue_free()#tirar da cena


	
	
