extends Area2D


# Teleport to Hub 
func _on_ElevatorArea_body_entered(body):
		if body == $"../YSort/Physics Player":
			$"../YSort/Physics Player/Camera2D".smoothing_enabled=false
			TransitionScreen.fadeIn("res://Scenes/Hub.tscn")

# Teleport to Minigame 1
func _on_interact_body_entered(body):
		if body == $"../YSort/Physics Player":
			TransitionScreen.fadeIn("res://Minigames/Water World/Scenes/Water 1.tscn")
