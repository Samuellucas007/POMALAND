extends KinematicBody2D


# VARIABLES
var velocity: Vector2
var directionVector = Vector2.ZERO
onready var animation = $animationPlayer
onready var animationTree = $animationTree
onready var animationState = animationTree.get("parameters/playback")

# Export speed to control
export (int) var speed 


# FUNCTIONS
# Define move vector
func move() -> void:
	directionVector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized() 
	velocity = directionVector * speed
	velocity = move_and_slide(velocity)

# Animate Player
func animate() -> void:
	if directionVector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", directionVector)
		animationTree.set("parameters/Move/blend_position", directionVector)
		animationState.travel("Move")
	else:
		animationState.travel("Idle")

# Physics
func _physics_process(_delta: float) -> void:
	move()
	animate()
