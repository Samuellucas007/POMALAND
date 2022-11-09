extends Control

func _on_VideoPlayer_finished():
	TransitionScreen.fadeIn("res://Scenes/Intro.tscn")
