extends StaticBody2D

var scene

# Teleport to Earthquake
func _on_interact_body_entered(body):
	if body == $"../YSort/Physics Player":
		scene = get_tree().change_scene("res://Minigames/Earthquake World/cenas/minigame3-level.tscn")
