extends KinematicBody2D

# variables
onready var animation: AnimationPlayer = get_node("Animation")
onready var sprite: Sprite = get_node("Sprite")
var player_ref = null
var velocity: Vector2
var canDie: bool = false
export (int) var speed

# function physics
func _physics_process(_delta:float) -> void:
	move()
	animate()
	verifyDirection()

# function of moviment
func move() -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		var distanceLength: float = distance.length()
		if distanceLength <= 20:
			velocity = Vector2.ZERO
			player_ref.kill()
		else:
			velocity = speed * direction
	else: 
		velocity = Vector2.ZERO
	velocity = move_and_slide(velocity)

# function of animation
func animate() -> void:
	if canDie: 
		animation.play("dead")
		set_physics_process(false)
	elif velocity != Vector2.ZERO: 
		animation.play("walk")
	else: 
		animation.play("idle")

# function verify if the person will going to be left or right		
func verifyDirection() -> void:
	if velocity.x >0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true

#functions detect the player or no
func on_body_entered(body):
	if body.is_in_group("player"): 
		player_ref = body

func on_body_exited(body):
	if body.is_in_group("player"):
		player_ref = null

func kill_enemy(area):
	if area.is_in_group("playerAttack"):
		canDie = true
 
func _on_animation_finished(anim_name):
	 if anim_name == "dead":
		 queue_free() 
		
		
 
