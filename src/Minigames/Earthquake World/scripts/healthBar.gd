extends TextureProgress

 

func updateHealth(_value):
	var health = self.value
	print(health)
	print(_value)
	get_node("Tween").interpolate_property("../healthBar", "value", self.value, self.value-_value, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	get_node("Tween").start()
