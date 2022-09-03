extends YSort

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var baseTime = 5.0
var time = 1.0
var Zombie = preload("res://Scenes/Enemy/Zombie.tscn")
onready var gamer = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	if time <= 0:
		var instance = Zombie.instance()
		add_child(instance)
		instance.position = gamer.position
		time = baseTime
