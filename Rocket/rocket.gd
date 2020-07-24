extends KinematicBody2D


export var MAX_SPEED = 700
export var ACCELERATION =  100
var motion = Vector2()
var speed = 0

func _physics_process(delta):
	
	if Input.is_action_pressed("nitro"):
		MAX_SPEED = 2500
		ACCELERATION= 500
	if !Input.is_action_pressed("nitro"):
		MAX_SPEED = 500 
		ACCELERATION = 100
	
	get_speed(delta)
	
	motion= Vector2(0,-1).rotated(get_rocket_rotation()) * get_speed(delta)
	
	get_animation()
	move_and_slide(motion)


func get_speed(delta):
	var direction = 0
	direction = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	
	#acceleration
	speed += direction * ACCELERATION *delta
	if speed>MAX_SPEED:
		speed = MAX_SPEED
	if direction==0:
		if speed<0:
			speed += ACCELERATION/2 * delta
			if speed > 0:
				speed = 0
		speed -= ACCELERATION/1.5 * delta
		if speed < 0: 
			speed = 0
	
	return speed



func get_rocket_rotation():
	var angle = 0
	angle = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	set_rotation_degrees((get_rotation_degrees()+ angle))
	
	return deg2rad(get_rotation_degrees())

func get_animation():
	if speed<100 and speed>-100 and speed!=0:
		$Anim1.play("Start")
		$Anim2.play("Start")
	elif (speed>100 and speed<700) or speed<-100:
		$Anim1.play("Fly")
		$Anim2.play("Fly")
	elif speed>700:
		$Anim1.play("Nitro")
		$Anim2.play("Nitro")
	else:
		$Anim1.play("Standby")
		$Anim2.play("Standby")





func _on_ChangeAnim_pressed():
	pass # Replace with function body.
