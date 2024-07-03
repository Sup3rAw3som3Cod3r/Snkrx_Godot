extends Node

const gw = 480
const gh = 270

const unitObj=preload("res://unit.tscn")

#this is the current snake in a run
var current_snake:Array[unit_class]=[
	preload("res://Classes/Test_Class.tres"),
	preload("res://Classes/Test_Class.tres"),
	preload("res://Classes/Test_Class1.tres"),
	preload("res://Classes/Test_Class1.tres"),
	preload("res://Classes/Test_Class2.tres"),
	preload("res://Classes/Test_Class2.tres"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
