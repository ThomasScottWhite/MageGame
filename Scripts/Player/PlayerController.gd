extends AnimatedSprite


# Declare member variables here. Examples:
var speed = 100
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
	   print("Mouse Click/Unclick at: ", event.position)

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

