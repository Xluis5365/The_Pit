extends StaticBody2D

var health = 2


func _on_PlayerDetector_body_entered(body):
	Global.ge1_damage = true
func _on_BulletDetector_area_entered(area):
	if health > 0:
		health -= 1
	else:
		queue_free()


func _on_PlayerSquashDetector_body_entered(body):
	Global.ge2_damage = true
