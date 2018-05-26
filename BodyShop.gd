extends Control

onready var BodyPartScene = preload("res://BodyPart.tscn")

var _selectedHead = null
var _selectedTorso = null
var _selectedArms = null
var _selectedLegs = null

func _ready():
	
	randomize()
	
	$CenterContainer/VBoxContainer/HeadBoxContainer.rect_size 
	for i in range(4):
		var headBodyPart = BodyPartScene.instance()
		headBodyPart._strength = randi()%10+1
		headBodyPart._speed = randi()%10+1
		headBodyPart._horror = randi()%10+1
		headBodyPart._dexterity = randi()%10+1
		headBodyPart._defense = randi()%10+1
		headBodyPart.get_node("TextureButton").connect("pressed", self, "_on_TextureButton_pressed", [headBodyPart])
		$CenterContainer/VBoxContainer/HeadBoxContainer.add_child(headBodyPart)
	
	for j in range(4):
		var torsoBodyPart = BodyPartScene.instance() 
		torsoBodyPart._strength = randi()%10+1
		torsoBodyPart._speed = randi()%10+1
		torsoBodyPart._horror = randi()%10+1
		torsoBodyPart._dexterity = randi()%10+1
		torsoBodyPart._defense = randi()%10+1
		torsoBodyPart.get_node("TextureButton").connect("pressed", self, "_on_TextureButton_pressed", [torsoBodyPart])
		$CenterContainer/VBoxContainer/TorsoBoxContainer.add_child(torsoBodyPart)
		
	for k in range(4):
		var armsBodyPart = BodyPartScene.instance()
		armsBodyPart._strength = randi()%10+1
		armsBodyPart._speed = randi()%10+1
		armsBodyPart._horror = randi()%10+1
		armsBodyPart._dexterity = randi()%10+1
		armsBodyPart._defense = randi()%10+1
		armsBodyPart.get_node("TextureButton").connect("pressed", self, "_on_TextureButton_pressed", [armsBodyPart])
		$CenterContainer/VBoxContainer/ArmsBoxContainer.add_child(armsBodyPart)
		
	for l in range(4):
		var legsBodyPart = BodyPartScene.instance()
		legsBodyPart._strength = randi()%10+1
		legsBodyPart._speed = randi()%10+1
		legsBodyPart._horror = randi()%10+1
		legsBodyPart._dexterity = randi()%10+1
		legsBodyPart._defense = randi()%10+1
		legsBodyPart.get_node("TextureButton").connect("pressed", self, "_on_TextureButton_pressed", [legsBodyPart])
		$CenterContainer/VBoxContainer/LegsBoxContainer.add_child(legsBodyPart)
	
	$CenterContainer/VBoxContainer/Button.disabled = true

func _on_TextureButton_pressed(var child):
	print("str: " + str(child._strength) + " speed: " + str(child._speed) + " horror: " + str(child._horror) + " dexterity: " + str(child._dexterity) + " defense: " + str(child._defense))
	
	var container = child.get_parent().get_name()
	if container == "HeadBoxContainer":
		if _selectedHead == null:
			_selectedHead  = child
		elif _selectedHead == child:
			child.get_node("TextureButton").pressed = false
			_selectedHead = null
		else:
			_selectedHead.get_node("TextureButton").pressed = false
			_selectedHead = child
	elif container == "TorsoBoxContainer":
		if _selectedTorso == null:
			_selectedTorso = child
		elif _selectedTorso == child:
			child.get_node("TextureButton").pressed = false
			_selectedTorso = null
		else:
			_selectedTorso.get_node("TextureButton").pressed = false
			_selectedTorso = child
	elif container == "ArmsBoxContainer":
		if _selectedArms == null:
			_selectedArms = child
		elif _selectedArms == child:
			child.get_node("TextureButton").pressed = false
			_selectedArms = null
		else:
			_selectedArms.get_node("TextureButton").pressed = false
			_selectedArms = child
	elif container == "LegsBoxContainer":
		if _selectedLegs == null:
			_selectedLegs = child
		elif _selectedLegs == child:
			child.get_node("TextureButton").pressed = false
			_selectedLegs = null
		else:
			_selectedLegs.get_node("TextureButton").pressed = false
			_selectedLegs = child
	
	if _selectedHead != null and _selectedArms != null and _selectedTorso != null && _selectedLegs != null:
		$CenterContainer/VBoxContainer/Button.disabled = false
	else:
		$CenterContainer/VBoxContainer/Button.disabled = true

func _on_Button_pressed():
	print("_on_Button_pressed")
