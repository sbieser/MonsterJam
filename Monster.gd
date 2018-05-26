extends Sprite

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
				direction = Vector2(-1,0)
				position.x = x_stop_position
				velocity = Vector2(0,0)
				is_attacking = false
				is_retreating = true
		elif is_retreating:
			if position.x <= x_orig_position:
				position.x = x_orig_position
				is_retreating = false
				direction = Vector2(1,0)
				velocity = Vector2(0,0)
func attack():
	#probably want to supply some kind of direction
	#pass
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