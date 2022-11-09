extends Node2D

# Variables
var dialogues = load("res://Src/HubDialogues.gd").new()
var enterFridge = false
# Change player position according to the room
func _ready():
	if Global.portalRoom == "Earthquake":
		$"Physics Player".position = Vector2(401, 37)
	elif Global.portalRoom == "Water":
		$"Physics Player".position = Vector2(446.450836, 123.73774)
	elif Global.portalRoom == "WaterWorld":
		$"Physics Player".position = Vector2(177, 65)
	if Global.waterStar == 3 and Global.earthStar == 4:
		match Global.language:
			"English": 
				$Final/Label2.text = "Find the fridge!"
			"Portuguese":
				$Final/Label2.text = "Encontre a geladeira!"
		$fridge/Geladeira/CollisionShape2D.disabled = false
		$fridge/dbox.visible = true
		$Final.visible = true

# Show move hint when on area
func _on_Directions_body_entered(body):
	if body == $"Physics Player":
		match Global.language:
			"English":
				$HintCanvas/Label.text = dialogues.textenMoveHint
			"Portuguese":
				$HintCanvas/Label.text = dialogues.textportMoveHint
		$HintCanvas.visible = true

# Hide move hint when on area
func _on_Directions_body_exited(body):
	if body == $"Physics Player":
		$HintCanvas.visible = false

# Show interact hint when on area
func _on_Area2D_body_entered(body):
	if body == $"Physics Player":
		match Global.language:
			"English":
				$HintCanvas/Label.text = dialogues.textenInteractHint
			"Portuguese":
				$HintCanvas/Label.text = dialogues.textportInteractHint
		$HintCanvas.visible = true

# Hide interact hint when on area
func _on_Area2D_body_exited(body):
	if body == $"Physics Player":
		$HintCanvas.visible = false
		
func _on_Geladeira_body_entered(body):
	if body == $"Physics Player":
		enterFridge = true


func _on_Geladeira_body_exited(body):
	if body == $"Physics Player":
		enterFridge = false

func Fridge():
	if Input.is_action_just_pressed("select") and enterFridge == true:
		match Global.language:
			"English":
				TransitionScreen.fadeIn("res://Minigames/Quiz/Quizen/Scenesen/Quiz.tscn")
			"Portuguese":
				TransitionScreen.fadeIn("res://Minigames/Quiz/Quizpt/Scenesquizpt/Quiz.tscn")

func _process(_delta):
	Fridge()
