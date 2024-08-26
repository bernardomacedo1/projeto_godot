extends CharacterBody2D


const SPEED = 300.0 # Velocidade constante 300
const JUMP_VELOCITY = -400.0 #velocidade do pulo 400

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # gravidade
#980
signal morri
var vida = 3
var is_dead = false
var is_takingdamage = false
var esta_pulando = false
var levou_dano = false


func _physics_process(delta): #funções dos processos físicos(delta)Adicionar gravidade
	# Add the gravity.
	if not is_on_floor(): #se nao "is on Floor"  - se não está no chão
		velocity.y += gravity * delta #gravidade*delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): #se # esta ação foi pressionada - input e o personagem está no chão
		velocity.y = JUMP_VELOCITY #velocidade*y - pulo velocidade
		esta_pulando = true
	elif is_on_floor():
		esta_pulando = false
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction !=0 && !is_takingdamage: #direção # movimento do personagem
		velocity.x = direction * SPEED #velocidade= direção
		$AnimatedSprite2D.scale.x= direction
		#$AnimatedSprite2D.play("run")
	else:#personagem parado
		velocity.x = move_toward(velocity.x, 0, SPEED) # Velocidade*x = 0
		#$AnimatedSprite2D.play("idle")
		
			#animações
	if !is_takingdamage: #se não estiver tomando dano
		if is_on_floor(): #se está pulando
			if esta_pulando: #se está pulando
				$AnimatedSprite2D.play("jump")
			elif direction!=0: #Em Movimento
				$AnimatedSprite2D.play("run")
			elif direction ==0: #Parado
				$AnimatedSprite2D.play("idle")	
	else:#não está no chao
		if velocity.y<0: #Movimento em Y Negativo
			$AnimatedSprite2D.play("jump")	
		else: #Movimento em Y Negativo
			$AnimatedSprite2D.Play("fall")
					
	move_and_slide() #move quadro

func _levouDano(dano):
	is_takingdamage = true
		#velocity.x = -400
		#animaçãodano
	$AnimatedSprite2D.play("hitanim")
	await $AnimatedSprite2D.animation_finished
	is_takingdamage = false
	#subtraindo vida
	vida -= dano
	print("vida:", vida)
		#caso vida chegue a zero
	if vida <=0:
		_morreu()
			
		#print("Morri ;-; ")
func _morreu():
	is_dead = true
	emit_signal("morreu")
