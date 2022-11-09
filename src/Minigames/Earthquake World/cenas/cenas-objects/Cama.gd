extends Area2D

var liberarCama: bool
var onArea: bool
var dialoguePart = 0
var read = false
var dialogues = load("res://Minigames/Earthquake World/scripts/EarthquakeDialogues.gd").new()
var finished: bool

func _ready():
	finished = false

func _on_Area2D_body_entered(body):
	if body == $"../YSort/person-machado":
		$dbox2.visible = true
		onArea = true

func _on_Area2D_body_exited(body):
	if body == $"../YSort/person-machado":
		$dbox2.visible = false
		onArea = false

func ShowDialogue1():
	if onArea == true:
		if Input.is_action_just_pressed("select"):
			$"Dialogue 1".visible = true
			match Global.language:
				"English":
					ChangeDialogue(dialogues.camaDialogue["english"])
					ArrowInvisible(dialogues.camaDialogue["english"])
				"Portuguese":
					ArrowInvisible(dialogues.camaDialogue["portuguese"])
					ChangeDialogue(dialogues.camaDialogue["portuguese"])
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
