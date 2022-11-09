extends CanvasLayer

# Change Labels Language
func _ready():
	match Global.language:
		"English":
			$Main/Main/Video.text = "Video"
			$Main/Main/Audio.text = "Audio"
			$Main/Main/Control.text = "Controls"
			$VideoSettings/VBoxContainer/Language/Lang.text = "Language"
			$AudioSettings/VBoxContainer/Language/Volume.text = "Master Volume"
			$Controls/VBoxContainer/Move.text = "Movement (↑ ↓ ← →)"
			$Controls/VBoxContainer/Interact.text = "Interact (Z)"
			$Controls/VBoxContainer/Attack.text = "Attack (Spacebar)"
			$Controls/VBoxContainer/Jump.text = "Jump (Spacebar)"
			$VideoSettings/VBoxContainer/Language/Btn.text = "English"
			$Main/Main/Back.text = "Back"
		"Portuguese":
			$Main/Main/Video.text = "Vídeo"
			$Main/Main/Audio.text = "Áudio"
			$Main/Main/Control.text = "Controles"
			$VideoSettings/VBoxContainer/Language/Lang.text = "Língua"
			$AudioSettings/VBoxContainer/Language/Volume.text = "Volume Principal"
			$Controls/VBoxContainer/Move.text = "Movimentação (↑ ↓ ← →)"
			$Controls/VBoxContainer/Interact.text = "Interação (Z)"
			$Controls/VBoxContainer/Attack.text = "Ataque (Espaço)"
			$Controls/VBoxContainer/Jump.text = "Pulo (Espaço)"
			$VideoSettings/VBoxContainer/Language/Btn.text = "Português"
			$Main/Main/Back.text = "Retornar"



func _on_Video_pressed():
	$AudioSettings.visible = false
	$Controls.visible = false
	$VideoSettings.visible = true
	$VideoSettings/VBoxContainer/WindowMode/CheckToFull.grab_focus()


func _on_Audio_pressed():
	$VideoSettings.visible = false
	$Controls.visible = false
	$AudioSettings.visible = true
	$AudioSettings/VBoxContainer/Language/Slider.grab_focus()

func _on_Control_pressed():
	$Controls.visible = true
	$VideoSettings.visible = false
	$AudioSettings.visible = false


func _on_Back_pressed():
	visible = false
	$"../Main".visible = true
	$"../Main/Center/Vertical/Start".grab_focus()
