extends Control

@onready var contador_pontos = $MarginContainer/HBoxContainer/contador_pontos
@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count #Timer conectado
@onready var timer_cont = $timer_cont as Timer

signal tempo_acabou() #para recarregar no mundo

var minutos = 0
var segundos = 0

#para limitar o tempo
@export_range(0,2) var min_padrao = 1 #valor inicial
@export_range(0,59) var seg_padrao = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	contador_pontos.text = str ("%03d" % Global.somaPontos)#Puxa o contador de melancia
	timer_count.text  = str ("%02d" % min_padrao) + ":" +str("%02d" % seg_padrao) #isso evita de o hud comer
	
	minutos = min_padrao
	segundos = seg_padrao
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	contador_pontos.text = str("%03d" % Global.somaPontos)
	if minutos == 0 && segundos ==0:
		emit_signal("tempo_acabou") #Emite um sinal que o tempo acabou
		
	


func _on_timer_cont_timeout():
	if segundos >= 60:
			segundos%= 60 
			minutos += 1
			
	if segundos ==0:
		if minutos >0:
			minutos-=1
			segundos = 60
		
	segundos -=1

	timer_count.text  = str ("%02d" % minutos) + ":" +str("%02d" % segundos) #isso evita de o hud comer
