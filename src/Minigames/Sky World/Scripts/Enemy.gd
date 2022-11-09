extends KinematicBody2D

var motion = Vector2() #variável do enemy em vector2

func _ready():
	pass # Replace with function body.

func _physiscs_process(delta):
	var Player = get_parent().get_node("Player") #pegando o node "player" de outra cena
	
	position += (Player.position - position)/50 #enemy vai atrás do player
	look_at(Player.position)
	
	move_and_collide(motion) #movimentação do inimigo para colidir com objetos do jogo
