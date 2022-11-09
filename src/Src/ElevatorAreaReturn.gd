extends Area2D

var scene


# To Earthquake world
func _on_interact_body_entered(body):
	if body == $"../YSort/Physics Player":
		TransitionScreen.fadeIn("res://Minigames/Earthquake World/cenas/minigame3-level.tscn")
		

# To Hub
func _on_ElevatorArea_body_entered(body):
	if body == $"../YSort/Physics Player":
		TransitionScreen.fadeIn("res://Scenes/Hub.tscn")
