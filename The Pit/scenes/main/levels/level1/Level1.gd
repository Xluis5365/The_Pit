extends Node2D


func _physics_process(delta):
	if Global.respawn == true:
		respawn()
func respawn():
	$Player.set_position(Global.last_position)
	$Player/FlashScreen/ColorRect.show()
	$Player/FlashScreen/FlashIN.play("flashin")
	Global.respawn = false
