extends Node

onready var BodyShopScene = preload("res://BodyShop.tscn")
onready var BattleScene = preload("res://Battle.tscn")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var bodyShop
var battle

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	bodyShop = BodyShopScene.instance()
	bodyShop.connect("partsPicked", self, "partsPicked")
	add_child(bodyShop)

func partsPicked(var head, var torso, var arms, var legs):
	print("partsPicked")
	battle = BattleScene.instance()
	remove_child(bodyShop)
	
	#battle probably needs to take in the new parts for the monster and update its stats
	add_child(battle)
