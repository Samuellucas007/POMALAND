extends Node2D

var signsRead: int
onready var plyr = get_node("YSort/person-machado")
var readHint1 = false
var readHint2 = false
var hintLabel = []

func _ready():
	Global.level = "Earthquake"
	signsRead = 0
	ResetStars()
	ChangeLang()
# Assigns read signs to stars in the game
func Metric():
	var bed = get_node("Cama").finished
	var chest = get_node("bau").finished
	var signn = get_node("placa").finished
	var table = get_node("Mesa").finished
	if bed == true:
		Global.earthStar += 1
	if chest == true:	
		Global.earthStar += 1
	if signn == true:
		Global.earthStar += 1
	if table == true:
		Global.earthStar += 1

func ResetStars():
	if Global.earthStar != 4:
		Global.earthStar = 0

func _on_interact_body_entered(body):
	if body == $"YSort/person-machado":
		Metric()
		TransitionScreen.fadeIn("res://Scenes/Portal Room A.tscn")
		


func _on_HintArea_body_entered(body):
	if readHint1 == false:
		if body == plyr:
			Hint1()
			readHint1 = true

func _on_HintArea_body_exited(body):
	if body == plyr:
		$Hint.visible = false

func ChangeLang():
	match Global.language:
		"Portuguese":
			hintLabel.append("Dica: Procure por todos os objetos espalhados pelo terremoto para ganhar estrelas")
			hintLabel.append("Tenha cuidado com os inimigos")
			hintLabel.append("Dica: Use (Espaço) para atacar")
		"English":
			hintLabel.append("Hint: Search for all the objects scattered by the earthquake to earn stars")
			hintLabel.append("Watch out for the enemies!")
			hintLabel.append("Hint: Use (Backspace) to attack")

func Hint1():
	$Hint.visible = true
	$Hint/Label.text = hintLabel[0]
	$Hint/Label2.text = hintLabel[1]

func Hint2():
	$Hint/Label2.visible = false
	$Hint.visible = true
	$Hint/Label.text = hintLabel[2]


func _on_HintArea2_body_entered(body):
	if readHint2 == false:
		if body == plyr:
			Hint2()
			readHint2 = true


func _on_HintArea2_body_exited(body):
	if body == plyr:
		$Hint.visible = false
