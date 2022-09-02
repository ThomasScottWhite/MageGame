extends AnimatedSprite


# Declare member variables here. Examples:
var health = 50
var speed = 50
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
	if player.position.x >= self.position.x:
		self.position.x += speed * delta
	if player.position.x <= self.position.x:
		self.position.x -= speed * delta
	if player.position.y >= self.position.y:
		self.position.y += speed * delta
	if player.position.y <= self.position.y:
		self.position.y -= speed * delta
