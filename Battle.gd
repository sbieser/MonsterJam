extends Node

var monsterHealth = 100

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$MonsterHealthBar.init(monsterHealth,100)

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
		$Monster.attack()
	if right:
		$Villager.attack()
		
		
	if z:
		#print("pressed z!!")
		#print(str($MonsterHealthBar.current_value))
		#var newHealth = monsterHealth - 5
		monsterHealth = monsterHealth - 5
		#print(str(newHealth))
		
		$MonsterHealthBar.setHealth(monsterHealth)
		print(str($MonsterHealthBar.current_value))
		