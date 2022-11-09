extends Node2D

var chrLookUp = Vector2(0, -1)
var scene

func _ready():
	$"YSort/Physics Player/animationTree".set("parameters/Idle/blend_position", chrLookUp)
	Global.portalRoom = "Earthquake"
	ShowStars()

# Change stars according to score in the game
func ShowStars():
	match Global.earthStar:
		0:
			$Star0.visible = true
		1:
			$Star1.visible = true
		2:
			$Star1.visible = true
		3:
			$Star2.visible = true
		4:
			$Star3.visible = true
