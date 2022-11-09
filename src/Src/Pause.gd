extends Control

var scene
var PauseSwitch: bool


# FUNCTIONS
func _ready():
	ChangeLanguage()
	PauseSwitch = false
	visible = false
# Press pause key to pause
func _input(event):
	if event.is_action_pressed("pause"):
		PauseSwitch = not PauseSwitch
		get_tree().paused = PauseSwitch
		visible = PauseSwitch
		if PauseSwitch == true:
			$CenterContainer/VBoxContainer/Return.grab_focus()

# Change label language
func ChangeLanguage():
	match Global.language:
		"English":
			$CenterContainer/VBoxContainer/Return.text = "Return to game"
			$CenterContainer/VBoxContainer/Menu.text = "Quit to menu"
		"Portuguese":
			$CenterContainer/VBoxContainer/Return.text = "Retornar ao jogo"
			$CenterContainer/VBoxContainer/Menu.text = "Sair ao menu"

# Press return to return to game
func _on_Return_pressed():
	get_tree().paused = false
	PauseSwitch = not PauseSwitch
	visible = PauseSwitch

# Go back to menu
func _on_Menu_pressed():
	get_tree().paused = false
	scene = get_tree().change_scene("res://Scenes/Menu.tscn")
