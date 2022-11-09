extends TextureRect

var onArea: bool
var dialoguePart = 0
var dialogues = load("res://Minigames/Water World/Src/WaterDialogues.gd").new()
var finishDialogue: bool

onready var holeS = get_node("/root/Water 1/HoleS")
onready var holeM = get_node("/root/Water 1/HoleM")
onready var holeL = get_node("/root/Water 1/HoleL")

func _ready():
	$dbox.visible = false
	finishDialogue = false

# Make dbox visible when player is close
func _on_Area2D_body_entered(body):
	if body == $"../Platform Plyr":
		$dbox.visible = true
		onArea = true

# Make dbox invisible when player is far
func _on_Area2D_body_exited(body):
	if body == $"../Platform Plyr":
		$dbox.visible = false
		onArea = false
		
func ShowDialogue():
	if onArea == true:
		if Input.is_action_just_pressed("select"):
			$"Dialogue 1".visible = true
			match Global.language:
				"English":
					ChangeDialogue(dialogues.sign2Talk["english"])
					ArrowInvisible(dialogues.sign2Talk["english"])
				"Portuguese":
					ArrowInvisible(dialogues.sign2Talk["portuguese"])
					ChangeDialogue(dialogues.sign2Talk["portuguese"])
	else:
		$"Dialogue 1".visible = false
		dialoguePart = 0

func ArrowInvisible(dial):
	$"Dialogue 1/AnimatedSprite".visible = true
	if dialoguePart >= len(dial) - 1:
		$"Dialogue 1/AnimatedSprite".visible = false

func ChangeDialogue(dial):
	if dialoguePart == len(dial) - 1:
		dialoguePart = 0
		finishDialogue = true
		$"Dialogue 1".visible = false
	else:
		dialoguePart += 1
		$"Dialogue 1/Label".text = str(dial[dialoguePart])

func MakeLight():
	if finishDialogue == true:
		holeS.visible = false
		holeM.visible = false
		holeL.visible = true

func _process(_delta):
	ShowDialogue()
	MakeLight()


