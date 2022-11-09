extends Area2D


# to the room A 
func _on_ElevatorArea_body_entered(body):
	if body == $"../Physics Player":
		TransitionScreen.fadeIn("res://Scenes/Portal Room A.tscn")
