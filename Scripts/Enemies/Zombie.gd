# Declare member variables here. Examples:
extends KinematicBody2D
# MUST BE A FLOAT
var maxHealth = 500.0
var health = maxHealth
var rng = RandomNumberGenerator.new()
var baseSpeed = rng.randi_range(40,50)
var currentSpeed = baseSpeed
var zombie_melee_range = 5
var zombie_damage = 10
var attackCooldown = 1.0
var currentAttackCooldown = 0
var velocity = Vector2()

onready var player = get_node("../../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	event_bus.connect("damage", self, "takedamage")


func takedamage(damage_position,damage_range,amount):
	if self.position.distance_to(damage_position) <= damage_range:
		health -= amount
	if health <= 0:
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta):
	pass
func _physics_process(delta):
	velocity = Vector2(0,0)
	if player.position.x-5 >= self.position.x:
		velocity.x = currentSpeed
		self.get_node("AnimatedSprite").play("Right")
	if player.position.x+5 <= self.position.x:
		velocity.x = -currentSpeed
		self.get_node("AnimatedSprite").play("Left")
	if player.position.y-5 >= self.position.y:
		velocity.y = currentSpeed
	if player.position.y+5 <= self.position.y:
		velocity.y = -currentSpeed

	if currentAttackCooldown >= 0:
		currentAttackCooldown -= delta
		velocity = velocity/10
	else:
		currentSpeed = baseSpeed
	
	if player.position.distance_to(self.position) <= zombie_melee_range and currentAttackCooldown <= 0:
		currentAttackCooldown = attackCooldown
		event_bus.emit_signal("player_damage", self.position,zombie_melee_range,zombie_damage)
	
	move_and_slide(velocity)
