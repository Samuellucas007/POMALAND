extends StaticBody2D
var onArea: bool
var dialoguePart = 0
var dialogues = load("res://Src/HubDialogues.gd").new()
# Make dbox visible when player is close
func _on_Area2D_body_entered(body):
	if body == $"../Physics Player":
		$dbox.visible = true
		onArea = true
# Make dbox invisible when player is far
func _on_Area2D_body_exited(body):
	if body == $"../Physics Player":
		$dbox.visible = false
		onArea = false
# Function that makes the dialogue work properly
func ShowDialogue1():
	#if the player is inside the area, the function _on_Area2D_body_entered will set the variable onArea as true
	if onArea == true:
		#if the player is inside the area and he press the key, the dialogue will start
		if Input.is_action_just_pressed("select"):
			$"Dialogue 1".visible = true
			# Checks which languange the user has selected and select the according list with the list
			match Global.language:
				"English":
					ChangeDialogue(dialogues.meneguzziTalk["english"])
					ArrowInvisible(dialogues.meneguzziTalk["english"])
				"Portuguese":
					ArrowInvisible(dialogues.meneguzziTalk["portuguese"])
					ChangeDialogue(dialogues.meneguzziTalk["portuguese"])
	else:
		$"Dialogue 1".visible = false
		dialoguePart = 0
# Makes the dialogue indicator invisible in the last box of dialogue
func ArrowInvisible(dial):
	$"Dialogue 1/AnimatedSprite".visible = true
	if dialoguePart >= len(dial) - 1:
		$"Dialogue 1/AnimatedSprite".visible = false
# Function responsible of changing the dialogue page
func ChangeDialogue(dial):
	if dialoguePart == len(dial) - 1:
		dialoguePart = 0
		$"Dialogue 1/AnimatedSprite".visible = true
		$"Dialogue 1".visible = false
	else:
		dialoguePart += 1
		$"Dialogue 1/Label".text = str(dial[dialoguePart])
#as almost all other functions are used in ShowDialogue1, the func _process_(_delta) calls this function permanently
func _process(_delta):
	ShowDialogue1()
