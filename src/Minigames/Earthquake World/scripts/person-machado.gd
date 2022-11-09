extends KinematicBody2D

# variables 
export (int) var speed 
export (int) var health
var velocity: Vector2
var canDie:bool = false
var directionVector = Vector2.ZERO
var canAttack: bool = false

onready var animation: AnimationPlayer = get_node("Animation")
onready var sprite: Sprite = get_node("Sprite")
onready var collision: CollisionPolygon2D = get_node("Area2D/collision")

func _ready():
	 collision.disabled = true

func _physics_process(_delta:float) -> void:
	move()
	attack()
	animate()
	verifyDirection()
	AttackArea()
	
func attack() -> void:
	if Input.is_action_just_pressed("ui_select") and not canAttack:
		canAttack = true
	
func move() -> void:
	directionVector = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")).normalized()
	velocity = speed * directionVector 
	velocity = move_and_slide(velocity)

func animate() -> void: 
	if canDie:
		animation.play("dead")
		set_physics_process(false)
	elif canAttack:
		animation.play("atack")
		set_physics_process(false)
	elif directionVector != Vector2.ZERO:
		animation.play("walk")
	else:
		animation.play("idle")

func verifyDirection() -> void:
	if velocity.x > 0: 
		sprite.flip_h = false
		collision.position = Vector2(0,13)
	elif velocity.x < 0: 
		sprite.flip_h = true
		collision.position = Vector2(-20,13)
	
		

func kill() -> void: 
	canDie = true
	
func on_animation_finished(anim_name):
	if anim_name == "dead": 
		gameOver()
	if anim_name == "atack":
		canAttack = false
		set_physics_process(true)

func AttackArea() -> void:
	if canAttack == true:
		collision.disabled = false
	else:
		collision.disabled = true
	
func gameOver() -> void:
	var _Reload: bool = get_tree().change_scene("res://Scenes/gameOver.tscn")
