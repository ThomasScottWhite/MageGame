extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var range_length


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")
	event_bus.emit_signal("damage",self.position,50,50)
	yield(get_tree().create_timer(0.50), "timeout")
	
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
