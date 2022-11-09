extends KinematicBody2D

# variables
onready var animation: AnimationPlayer = get_node("animation")
onready var sprite: Sprite = get_node("Sprite")
var player_ref = null
var velocity: Vector2
onready var animationTree: AnimationTree = get_node("animationTree")
onready var animationStates = animationTree.get("parameters/playback")
var direction: Vector2
var canDie: bool = false

export (int) var speed
# var dead = load("res:://Minigames/Eartquake World/scripts/person-machado.gd").new()

# function physics
func _physics_process(_delta:float) -> void:
	move()
	animate()
	verifyDirection()
	
# function of moviment
func move() -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		direction = distance.normalized()
		var distanceLength: float = distance.length()
		if distanceLength <= 20:
			velocity = Vector2.ZERO
			animation.play("atack-back")
			set_physics_process(true)
			player_ref.kill()
		else:
			velocity = speed * direction
	else: 
		velocity = Vector2.ZERO
	velocity = move_and_slide(velocity)
	
# function of animation
func animate() -> void:
	if canDie:
		animation.play("dead-back")
		set_physics_process(false)
		
	if velocity != Vector2.ZERO: 
		animationTree.set("parameters/Idle/blend_position", direction)
		animationTree.set("parameters/Walk/blend_position", direction)
		animationStates.travel("walk")
		
# function verify if the person will going to be left or right		
func verifyDirection() -> void:
	if velocity.x >0:
		sprite.flip_h = true
	elif velocity.x < 0:
		sprite.flip_h = false
	
#functions detect the player or no
func _on_detection_body_entered(body):
	if body.is_in_group("player"): 
		player_ref = body

func _on_detection_body_exited(body):
	if body.is_in_group("player"):
		player_ref = null


# function kill
func _on_collisionArea_area_entered(area):
	if area.is_in_group("playerAttack"):
		canDie = true
		
func _on_kill_animation_finished(anim_name):
	if anim_name == "dead-back":
		animationTree.set("parameters/Dead/blend_position", direction)
		queue_free() 
