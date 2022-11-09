extends Node2D

var chrLookRight = Vector2(1, 0)
var scene

# Change stars according to score in the game
func _ready():
	$"YSort/Physics Player/animationTree".set("parameters/Idle/blend_position", chrLookRight)
	if Global.portalRoom == "WaterWorld":
		$"YSort/Physics Player".position = Vector2(179, 78)
	Global.portalRoom = "Water"
	if Global.waterStar == 1:
		$Star1.visible = true
	elif Global.waterStar == 2:
		$Star2.visible = true
	elif Global.waterStar == 3:
		$Star3.visible = true
	else:
		$Star0.visible = true

			


