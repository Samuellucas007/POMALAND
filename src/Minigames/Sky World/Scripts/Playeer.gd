extends KinematicBody2D

const aceleracao = 500
const velocidadeMax = 140
const friccao = 500  

var velocidade = Vector2.ZERO
var bulletSpeed = 400

const bulletPath = preload("res://Minigames/Sky World/Scenes/Bullet.tscn")


onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback") #aloca a animação que queremos

func _physics_process(delta):
	var vector_movement = Vector2.ZERO
	vector_movement.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	vector_movement.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up") #moviment
	vector_movement = vector_movement.normalized() # "normaliza" os vetores nas diagonais (circunferencia)
	
	if vector_movement != Vector2.ZERO:
		animationTree.set("parameters/andando/blend_position", vector_movement) #chamando o animation tree pra movimentar a sprite
		animationTree.set("parameters/parado/blend_position", vector_movement)
		velocidade = velocidade.move_toward(vector_movement * velocidadeMax, aceleracao * delta) # delta serve pra evitar lagging
		animationState.travel("andando") #quando o vetor não for zero, o personagem anda
	else:
		animationState.travel("parado") #quando o vetor  for zero, o personagem para
		velocidade = velocidade.move_toward(Vector2.ZERO, friccao * delta)
	
	velocidade = move_and_slide(velocidade)
	
	if Input.is_action_just_pressed("ui_accept"): #se o botão enter for apertado
		shoot() # a função é chamada
		print ("working!") 
	
func shoot():
	var bullet = bulletPath.instance() #instanciando a cena da bala
	
	get_parent().add_child(bullet) #adicionando as balas a cena do player

	bullet.position = $Position3D.global_position # a posição da bala é igual a posição do position 2D
	
