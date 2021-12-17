extends KinematicBody2D

var FLYRANGE = 20
var GRAVITY = 20
var JUMPFORCE = 0
var velocity = Vector2(0,0)
func _ready():
	randomize()
	var SVD = (randi() % 10)
	print("SVD =", SVD)
	if SVD == 10:
		FLYRANGE = -110
		JUMPFORCE = -110
	elif SVD == 9:
		FLYRANGE = 100
		JUMPFORCE = -100
	elif SVD == 8:
		FLYRANGE = -90
		JUMPFORCE = -90
	elif SVD == 7:
		FLYRANGE = 80
		JUMPFORCE = -80
		velocity.y = JUMPFORCE
	elif SVD == 6:
		FLYRANGE = 70
		JUMPFORCE = -70
		velocity.y = JUMPFORCE
	elif SVD == 5:
		FLYRANGE = -60
		JUMPFORCE = -60
		velocity.y = JUMPFORCE
	elif SVD == 4:
		FLYRANGE = -50
		JUMPFORCE = -50
		velocity.y = JUMPFORCE
	elif SVD == 3:
		FLYRANGE = 40
		JUMPFORCE = -40
		velocity.y = JUMPFORCE
	elif SVD == 2:
		FLYRANGE = -30
		JUMPFORCE = -30
		velocity.y = JUMPFORCE
	elif SVD == 1:
		FLYRANGE = 20
		JUMPFORCE = -20
		velocity.y = JUMPFORCE
	elif SVD == 0:
		FLYRANGE = -10
		JUMPFORCE = -10
		velocity.y = JUMPFORCE
func _physics_process(delta):
	if is_on_floor() == false:
		velocity.x += FLYRANGE
		velocity.y += GRAVITY
	if is_on_floor():
		GRAVITY = 0
		FLYRANGE = 0
		velocity.x -= FLYRANGE
		velocity.y -= GRAVITY
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity,Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)
func _on_PlayerDetector_body_entered(body):
	Global.add_cur_game_sa = true
	Global.play_shell_sound = true
	Global.shell_amount += 1
	queue_free()
