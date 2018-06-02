extends Node

onready var BodyShopScene = preload("res://BodyShop.tscn")
onready var BattleScene = preload("res://Battle.tscn")
onready var MonsterScene = preload("res://Monster.tscn")
onready var VillagerScene = preload("res://Villager.tscn")

var bodyShop
var battle
var monster 
var villager

func _ready():
	randomize()
	
	# Called every time the node is added to the scene.
	# Initialization here
	bodyShop = BodyShopScene.instance()
	bodyShop.connect("partsPicked", self, "partsPicked")
	add_child(bodyShop)
	
	monster = MonsterScene.instance()	
	
func partsPicked(var head, var torso, var arms, var legs):
	print("partsPicked")
	#we probably need to habe a monster instance lying around so we can easily update it
	remove_child(bodyShop)
	
	#need to set new parts to monster 
	monster.set_parts(head, torso, arms, legs)
	
	#need way to set up the villagers better
	villager = VillagerScene.instance()
	#randi()%10+1
	#func init(var health, var attack, var defense, var bravdo):
	villager.init(rand_range(10, 15), randi()%7+1, randi()%7+1, randi()%7+1)
	
	#battle probably needs to take in the new parts for the monster and update its stats
	battle = BattleScene.instance()
	
	#each battle should be a new instance that we pass the monster and villager to
	#villager might be highly customizeable, such that it might need its own init function to set the sprite
	#and its stats. Or, each type of villager get its own scene??
	print("partsPicked")
	battle.init(monster, villager)
	add_child(battle)