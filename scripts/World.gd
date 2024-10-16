extends Node2D

@onready var timer := $Text_Timer
@onready var label := $Label
@onready var keys := $Keys
@onready var anwser := $Keys/Lock/LineEdit
@onready var Trunk := $Trunk

var line = 0
var dialogo = [
	"Hum... veja so o que encontramos na floresta, um bau encantado! ",
	"*som tentando abrir o bau *",
	"Ele parece estar trancado, deve guardar algo muito valioso...",
	"Mas veja só, tem 4 chaves e uma messagem perto dele",
	"A mensagem diz que apenas a chave certa abrira o bau",
	"caso a chave errada seja usada 3 vezes, o bau ira se destruir!",
	"para abrirmos o bau, devemos usar a chave que contem uma expressao",
	"de mesmo valor que no cadeado do bau",
]

func _ready():
	timer.start()

func _on_line_edit_text_submitted(new_text):
	if anwser.text == new_text :
		Trunk.play("Open")
		

func _on_timer_timeout():
	if line <= dialogo.size()-1 :
		label.text = dialogo[line]
		line += 1
	else:
		label.text = " "
		timer.autostart = false 
		keys.visible = true
