extends CharacterBody2D

var SPEED := 120.0

var on_stairs := false

func _physics_process(_delta):
	if Global.can_control:
		move()
		animate()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * Vector2(30, 8))
	
	# Handle speed
	if Input.is_action_pressed("sprint"):
		SPEED = 180.0
	else:
		SPEED = 120.0
	if on_stairs:
		SPEED = SPEED/2
	
func move():
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED
	move_and_slide()

func animate():
	if velocity.x < 0:
		$anim.play("left")
	elif velocity.x > 0:
		$anim.play("right")
	elif velocity.y > 0:
		$anim.play("backward")
	elif velocity.y < 0:
		$anim.play("forward")
	else:
		$anim.stop()


func _on_stair_body_entered(body):
	if body == self:
		on_stairs = true


func _on_stair_body_exited(body):
	if body == self:
		on_stairs = false
