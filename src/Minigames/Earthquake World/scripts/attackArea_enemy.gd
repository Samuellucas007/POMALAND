extends Area2D

onready var animation: AnimationPlayer = get_parent().get_node("Animation") as AnimationPlayer

func _on_AttackArea_area_entered(_area):
	get_parent().get_node("healthBar").udpateHealth(value)
