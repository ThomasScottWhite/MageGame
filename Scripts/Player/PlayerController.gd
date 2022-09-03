extends AnimatedSprite


# Declare member variables here. Examples:
#Level Stats
var level = 1
var xp = 0

#Spell Stats
var attackSpeed = 1.0
var projectileAmount = 1.0
var attackRangeMultiplier = 1.0
var fireDamageMultiplier = 1.0
var waterDamageMultiplier = 1.0
var lightningDamageMultiplier = 1.0
var spellDamageMultiplier = 1.0

#Abilitiy States
var speed = 100
var health = 50
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	event_bus.connect("player_damage", self, "takedamage")

func takedamage(damage_position,damage_range,amount):
	if self.position.distance_to(damage_position) <= damage_range:
		health -= amount
	if health <= 0:
		print("dead")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
		self.play("Right")
	if Input.is_action_pressed("move_left"):
		position.x += -speed * delta
		self.play("Left")
	if Input.is_action_pressed("move_up"):
		position.y += -speed * delta
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta

