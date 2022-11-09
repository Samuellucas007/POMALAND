extends CenterContainer

var scene
var isFull

onready var langBtn = $VBoxContainer/Language/Btn

# Check language
func _ready():
	if 	OS.window_fullscreen == true:
		$VBoxContainer/WindowMode/CheckToFull.pressed = true
	else:
		$VBoxContainer/WindowMode/CheckToFull.pressed = false
		
# Press to fullscreen
func _input(_event):
	if $VBoxContainer/WindowMode/CheckToFull.pressed == true:
		OS.window_fullscreen = true
	else:
		OS.window_fullscreen = false

func _on_Btn_pressed():
	print(Global.language)
	if Global.language == "Portuguese":
		Global.language = "English"
		scene = get_tree().reload_current_scene()
	elif Global.language == "English":
		Global.language = "Portuguese"
		scene = get_tree().reload_current_scene()
