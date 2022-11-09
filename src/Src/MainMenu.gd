extends CanvasLayer

# Change menu label language
func _ready():
	match Global.language:
		"English":
			$Center/Vertical/Start.text = "Start Game"
			$Center/Vertical/Options.text = "Settings"
			$Center/Vertical/Quit.text = "Quit Game"
		"Portuguese":
			$Center/Vertical/Start.text = "Iniciar Jogo"
			$Center/Vertical/Options.text = "Configurações"
			$Center/Vertical/Quit.text = "Sair do jogo"
