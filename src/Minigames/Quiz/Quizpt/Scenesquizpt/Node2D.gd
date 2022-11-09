extends Node2D

var inicio
var final = 0
var n = 0
var entrada = 1000000

func _ready():
	inicio = OS.get_unix_time()
	for i in range(0, entrada):
		n = 1
	
