extends KinematicBody2D


export (int) var lvl
export (NodePath) var points
var touched_once = false
var shown = false
#export (PackedScene) var retry_lvl 
var start = false
var enemy_touched = false
var movement = 0

var touched_an_enemy = 0

func ready():
	pass

func _process(delta):
	if start == true:
		move_and_collide(Vector2(-5,1))
		
	$CanvasLayer/Mission_failed.lvl_inside = lvl
	
	if start and enemy_touched and !shown :
		if touched_an_enemy == 1:
			$CanvasLayer/Mission_failed.show()
			shown == true




func _on_StartPosition_body_entered(body):
	if body.is_in_group("player"):
		start = true


func _on_EnemyCollision_body_entered(body):
	if body.is_in_group("player"):
		if start == true:
			enemy_touched = true
			touched_an_enemy += 1
	if body.is_in_group("bullet") and touched_once==false:
		get_node(points).points += 1
		$Anim.play("Explode")
		touched_once = true


