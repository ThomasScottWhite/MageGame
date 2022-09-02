extends AnimatedSprite


# Declare member variables here. Examples:
var health = 50
var baseSpeed = 50
var currentSpeed = baseSpeed
var zombie_melee_range = 5
var zombie_damage = 10
var attackCooldown = 1.0
var currentAttackCooldown = 0

onready var player = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	event_bus.connect("damage", self, "takedamage")

func takedamage(damage_position,damage_range,amount):
	if self.position.distance_to(damage_position) <= damage_range:
		health -= amount
	if health <= 0:
		queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentAttackCooldown -= delta
	if player.position.x >= self.position.x:
		self.position.x += currentSpeed * delta
	if player.position.x <= self.position.x:
		self.position.x -= currentSpeed * delta
	if player.position.y >= self.position.y:
		self.position.y += currentSpeed * delta
	if player.position.y <= self.position.y:
		self.position.y -= currentSpeed * delta
		
	if currentAttackCooldown >= 0:
		currentAttackCooldown -= delta
		currentSpeed = 0
	else:
		currentSpeed = baseSpeed
	if player.position.distance_to(self.position) <= zombie_melee_range and currentAttackCooldown <= 0:
		currentAttackCooldown = attackCooldown
		event_bus.emit_signal("player_damage", self.position,zombie_melee_range,zombie_damage)
