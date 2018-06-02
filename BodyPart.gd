extends Control

signal BodyPartButtonPressed

export (int) var _strength = 0
export (int) var _speed = 0
export (int) var _horror = 0
export (int) var _dexterity = 0
export (int) var _defense = 0

func get_strength():
	return _strength;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_TextureButton_mouse_entered():
	print("_on_TextureButton_mouse_entered")

func _on_TextureButton_mouse_exited():
	print("_on_TextureButton_mouse_exited")

func _on_TextureButton_pressed():
	emit_signal("BodyPartButtonPressed")
