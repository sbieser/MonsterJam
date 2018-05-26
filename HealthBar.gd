extends Node2D

export (bool) var display_health_text = true

# Helath values
export (int) var max_value = 100
var current_value = 100

func _ready():
	if !display_health_text:
		$HealthText.hide()

func updatePercentage():
	var percentage = current_value / max_value
	print(str(percentage))
	$Health.rect_scale.x = percentage
	var healthText = str(percentage * 100) + "%"
	$HealthText.text = healthText.pad_decimals(0)
	
func init(max_value, current_value):
	self.max_value = max_value * 1.0
	self.current_value = clamp(current_value * 1.0, 0, self.max_value)
	updatePercentage()

func setHealth(value):
	self.current_value = clamp(value, 0, self.max_value)
	print(str(self.current_value))
	updatePercentage()
