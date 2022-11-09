extends CenterContainer

# Save audio volume
func _ready():
	$VBoxContainer/Language/Slider.value = AudioServer.get_bus_volume_db(Global.masterBus)

# Control audio volume
func _on_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(Global.masterBus, value)
	if value == -30:
		AudioServer.set_bus_mute(Global.masterBus, true)
	else:
		AudioServer.set_bus_mute(Global.masterBus, false)
