extends Sprite

signal attack_start
signal attack_end
signal attack_appex

const MAX_VELOCITY = Vector2(400,0) 	#Velocity should not reach faster than 400
const ACCELERATION = Vector2(12,0) 		#This is the rate at which the velocity is increased
										#A larger value will get to MAX_VELOCITY faster, a smaller value
										#takes longer to reach MAX_VELOCITY

var is_attacking = false
var is_retreating = false

var x_stop_position
var x_orig_position
var velocity = Vector2(0,0)
var direction = Vector2(1,0)

var bp_head = null
var bp_torso = null
var bp_arms = null
var bp_legs = null

var health = 100
var max_health = 100

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	x_stop_position = ProjectSettings.get_setting("display/window/size/width") / 2
	x_orig_position = position.x
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#pass
	if is_attacking or is_retreating:
		applyMovement(delta) #Ideally, we only want to apply the movement when the monster is attacking
		if is_attacking:
			if position.x > x_stop_position:
				print("emit_signal::attack_appex")
				emit_signal("attack_appex")
				direction = Vector2(-1,0)
				position.x = x_stop_position
				velocity = Vector2(0,0)
				is_attacking = false
				is_retreating = true
		elif is_retreating:
			if position.x <= x_orig_position:
				print("emit_signal::attack_end")
				emit_signal("attack_end")
				position.x = x_orig_position
				is_retreating = false
				direction = Vector2(1,0)
				velocity = Vector2(0,0)
func attack():
	#probably want to supply some kind of direction
	#pass
	print("emit_signal::attack_start")
	emit_signal("attack_start")
	is_attacking = true

func applyMovement(delta):
	appyHorizontalAcceleration()
	position += velocity * delta

func appyHorizontalAcceleration():
	if direction.x > 0.0:
		if velocity.x < MAX_VELOCITY.x:
			velocity.x = min(velocity.x + ACCELERATION.x, MAX_VELOCITY.x)
	elif direction.x < 0.0:
		if velocity.x > -MAX_VELOCITY.x:
			velocity.x = max(velocity.x - ACCELERATION.x, -MAX_VELOCITY.x)
			
func set_parts(var head, var torso, var arms, var legs):
	bp_head = head
	bp_torso = torso
	bp_arms = arms
	bp_legs = legs

func set_health(var value):
	health = clamp(value, 0, max_health)
	
func get_health():
	return health
func get_max_health():
	return max_health;
	
#export (int) var _strength = 0
#export (int) var _speed = 0
#export (int) var _horror = 0
#export (int) var _dexterity = 0
#export (int) var _defense = 0	
func get_strength():
	return bp_head.get_strength() + bp_torso.get_strength() + bp_arms.get_strength() +  bp_legs.get_strength()
func get_speed():
	pass
func get_horror():
	pass
func get_dexterity():
	pass
func get_defense():
	pass
