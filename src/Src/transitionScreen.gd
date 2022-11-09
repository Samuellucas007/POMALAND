extends CanvasLayer

onready var animation = get_node("animation")
var targetLevel: String
signal startGame

# Function that occurs when changing scene
func fadeIn(level:String) -> void:
	targetLevel = level
	animation.play("fadeIn")
	

# When fade in ends, fade out begins
func _on_animation_finished(anim_name):
	if anim_name == "fadeIn":
		var _change = get_tree().change_scene(targetLevel)
		animation.play("fadeOut")
	elif anim_name =="fadeOut":
		emit_signal("startGame")
