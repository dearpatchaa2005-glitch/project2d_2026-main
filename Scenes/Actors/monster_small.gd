extends Enemy

func _ready() -> void:
	super._ready()
	var types = Array($Sprite/AnimateSprite.sprite_frames.get_animation_names())
	$Sprite/AnimateSprite.animation = types.pick_random()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_wall():
		direction *= -1
	
	velocity.x = speed * direction
	move_and_slide()

func _on_state_changed(new_state: Enemy.State) -> void:
	if new_state == Enemy.State.IDLE || new_state == Enemy.State.DEAD:
		$Sprite/AnimateSprite.play("",0.1)
	else:
		$Sprite/AnimateSprite.play("",1.0)
