extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Lightning = preload("res://Scenes/Spells/Lightning/LightningBolt.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		var instance = Lightning.instance()
		add_child(instance)
		instance.position = event.position/10
		print("Mouse Click/Unclick at: ", event.position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
