#TODO: How does the battle run on its own?
#TODO: We probably need to add some signals to each monster and villager when they are at the appex
# of fighting

extends Node

#var monsterHealth = 100
var monster
var opponent

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#$MonsterHealthBar.init(monsterHealth,100)
	pass
	
func init(var monster, var opponent):
	#print("Battle::init")
	self.monster = monster
	print(self.monster)
	self.monster.connect("attack_start", self, "_on_attack_start")
	self.monster.connect("attack_end", self, "_on_attack_end")
	self.monster.connect("attack_appex", self, "_on_attack_appex")
	self.monster.position = $MonsterPosition.position
	$MonsterHealthBar.init(self.monster.get_max_health(), self.monster.get_health())
	add_child(self.monster)
	
	self.opponent = opponent
	self.opponent.position = $VillagerPosition.position
	$VillagerHealthBar.init(self.opponent.get_health(), self.opponent.get_health())
	add_child(self.opponent)

func _on_attack_start():
	print("_on_attack_start")
	
func _on_attack_end():
	print("_on_attack_end")
	
func _on_attack_appex():
	print("_on_attack_appex")
	var monster_attack = monster.get_strength()
	opponent.set_health(opponent.get_health() - monster_attack)
	$VillagerHealthBar.setHealth(opponent.get_health())
	

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	getInput()

func getInput():
	var left = Input.is_action_just_pressed("ui_left")
	var right = Input.is_action_just_pressed("ui_right")
	var z = Input.is_action_just_pressed("ui_z")
	var x = Input.is_action_just_pressed("ui_x")
	if left:
		monster.attack()
	if right:
		opponent.attack()
	if z:
		monster.set_health(monster.get_health() - 5)
		$MonsterHealthBar.setHealth(monster.get_health())
		#monsterHealth = monsterHealth - 5
		#$MonsterHealthBar.setHealth(monsterHealth)
		#print(str($MonsterHealthBar.current_value))
		