extends Area2D

var liberarMesa:bool
var dialogues = load("res://Minigames/Earthquake World/scripts/EarthquakeDialogues.gd").new()
var onArea: bool
var dialoguePart = 0

var finished: bool

func _ready():
	finished = false
	
func _on_Area2D_body_entered(body):
	if body == $"../YSort/person-machado":
		$dbox.visible = true
		onArea = true

func _on_Area2D_body_exited(body):
	if body == $"../YSort/person-machado":
		$dbox.visible = false
		onArea = false

func ShowDialogue1():
	if onArea == true:
		if Input.is_action_just_pressed("select"):
			$"Dialogue 1".visible = true
			match Global.language:
				"English":
					ChangeDialogue(dialogues.mesaDialogue["english"])
					ArrowInvisible(dialogues.mesaDialogue["english"])
				"Portuguese":
					ArrowInvisible(dialogues.mesaDialogue["portuguese"])
					ChangeDialogue(dialogues.mesaDialogue["portuguese"])
	else:
		$"Dialogue 1".visible = false
		dialoguePart = 0


func ArrowInvisible(dial):
	$"Dialogue 1/AnimatedSprite".visible = true
	if dialoguePart >= len(dial) - 1:
		$"Dialogue 1/AnimatedSprite".visible = false

func ChangeDialogue(dial):
	if dialoguePart == len(dial) - 1:
		finished = true
		dialoguePart = 0
		$"Dialogue 1/AnimatedSprite".visible = true
		$"Dialogue 1".visible = false
	else:
		dialoguePart += 1
		$"Dialogue 1/Label".text = str(dial[dialoguePart])
		
func _process(_delta):
	ShowDialogue1()
