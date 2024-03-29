extends Area2D

#SPEED VARIABLES
const SPEED_X_LEFT = -800
const SPEED_X_RIGHT = 800
const SPEED_Y_UP = -800
const SPEED_Y_DOWN = 800

#SHOOT DIRECTION VARIABLES
var shootright = false
var shootleft = false
var shootdown = false
var shootup = false


func _ready():
	if Input.is_action_pressed("up"):
		shootup = true
	elif Input.is_action_pressed("down"):
		shootdown = true
	elif Global.scale_x == -4:
		shootleft = true
	elif Global.scale_x == 4:
		shootright = true
func _physics_process(delta):
	if shootleft == true:
		position.x += SPEED_X_LEFT * delta
		$Sprite.show()
		$Sprite1Coll.disabled = false
	elif shootright == true:
		position.x += SPEED_X_RIGHT * delta
		$Sprite.show()
		$Sprite1Coll.disabled = false
	elif shootup == true:
		position.y += SPEED_Y_UP * delta
		$Sprite2.show()
		$Sprite2Coll.disabled = false
	elif shootdown == true:
		position.y += SPEED_Y_DOWN * delta
		$Sprite2.show()
		$Sprite2Coll.disabled = false
func _on_Bullet_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$DiePlayerTimer.play("timer")
func _on_Bullet_body_entered(body):
	$DiePlayerTimer.play("timer")
func _on_DiePlayerTimer_animation_finished(anim_name):
	queue_free()
func _on_QueTimer_animation_finished(anim_name):
	queue_free()
func _on_WallFinder_body_entered(body):
	queue_free()
