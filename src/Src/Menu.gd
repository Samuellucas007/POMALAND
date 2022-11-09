extends Control


# Grab focus to start button
func _ready():
	$Main/Center/Vertical/Start.grab_focus()

# Press start to start the game
func _on_Start_pressed():
	return get_tree().change_scene("res://Scenes/Hub.tscn")

# Press to get game settings
func _on_Options_pressed():
	$Main.visible = false
	$Options.visible = true
	$Options/VideoSettings.visible = true
	$Options/AudioSettings.visible = false
	$Options/Controls.visible = false
	$Options/Main/Main/Video.grab_focus()

# Press quit to quit the game
func _on_Quit_pressed():
	return get_tree().quit()


func ready():
	$Main/Center/Vertical/Start.grab_focus()

