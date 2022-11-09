extends Area2D

var keyStatus: bool

func _on_FinalArea_body_entered(body):
	if body == $"../../Platform Plyr":
		keyStatus = get_node("../../Key").hasKey
		if keyStatus == true:
			UnlockArea()

# Unlock Final Area
func UnlockArea():
	$"..".position.y = -1540.52
	$"..".visible = false
