extends Area2D

var hasKey: bool

func _ready():
	hasKey = false
	
func _on_Key_body_entered(body):
	if body == $"../Platform Plyr":
		visible = false
		$"../CanvasLayer/KeyGui".visible = true
		hasKey = true

