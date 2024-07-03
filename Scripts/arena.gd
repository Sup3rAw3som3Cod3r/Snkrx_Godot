class_name Arena
extends Node2D

var pos1:Vector2
var pos2:Vector2
var dif:Vector2

var gw
var gh



var snake

# Called when the node enters the scene tree for the first time.
func _ready():
	gw=Globals.gw
	gh=Globals.gh
	pos1 = Vector2(gw/2 - 0.8*gw/2, gh/2 - 0.8*gh/2)
	pos2 = Vector2(gw/2 + 0.8*gw/2, gh/2 + 0.8*gh/2)
	dif=pos2-pos1
	
	wallPoly(-40, -40, pos1.x, gh + 40,$WallL/Shape)
	wallPoly(pos2.x, -40, gw + 40, gh + 40,$WallR/Shape)
	wallPoly(pos1.x, -40, pos2.x, pos1.y,$WallT/Shape)
	wallPoly(pos1.x, pos2.y, pos2.x, gh + 40,$WallB/Shape)
	
	$WallLine.add_point(Vector2(pos2.x, pos1.y))
	$WallLine.add_point(Vector2(pos1.x, pos1.y))
	$WallLine.add_point(Vector2(pos1.x, pos2.y))
	$WallLine.add_point(Vector2(pos2.x, pos2.y))
	
	spawn_head(Vector2(gw/2,gh/2+16))



func wallPoly(px1,py1,px2,py2,pol):
	pol.polygon[0]=Vector2(px1,py1)
	pol.polygon[1]=Vector2(px2,py1)
	pol.polygon[2]=Vector2(px2,py2)
	pol.polygon[3]=Vector2(px1,py2)
	

func spawn_head(pos):
	var u=Globals.unitObj.instantiate()
	u.position = pos
	u.leader=true
	u.index=0
	add_child(u)
	u.prep()
	snake=u


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
