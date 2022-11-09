extends Area2D

var liberarPlaca: bool
var onArea: bool
var dialoguePart = 0
var dialogues = load("res://Minigames/Earthquake World/scripts/EarthquakeDialogues.gd").new()
var finished: bool 

func _ready():
	finished = false

func _on_Area2D_body_entered(body):
	if body == $"../YSort/person-machado":
		$dbox4.visible = true
		onArea = true

func _on_Area2D_body_exited(body):
	if body == $"../YSort/person-machado":
		$dbox4.visible = false
		onArea = false
	liberarPlaca = true

func ShowDialogue1():
	if onArea == true:
		if Input.is_action_just_pressed("select"):
			$"Dialogue 1".visible = true
			match Global.language:
				"English":
					ChangeDialogue(dialogues.placaDialogue["english"])
					ArrowInvisible(dialogues.placaDialogue["english"])
				"Portuguese":
					ArrowInvisible(dialogues.placaDialogue["portuguese"])
					ChangeDialogue(dialogues.placaDialogue["portuguese"])
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
