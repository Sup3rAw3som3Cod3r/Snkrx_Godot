class_name segment
extends Node2D


var r=0
var velocity:Vector2 = Vector2.ZERO

var leader:bool = false

var follower:segment
var index=0
var following:segment

var prev_pos=[]

var myClass
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(Globals.gw/2,Globals.gh/2 + 16)
	do_prev()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move(delta)


#move (only head for now
func move(delta):
	
	if leader:
		#turn
		var mov=Input.get_axis("Left","Right")
		r += 1.66*PI*delta*mov
		#move
		#75
		var total_v=75 * 1.5
		velocity = Vector2(total_v*cos(r),total_v*sin(r))
		rotation = r
		global_position += velocity * delta
	elif following != null:
		var trg_dist = 10.4
		var trg
		var tot_dist=0
		var prev:Vector2 = following.global_position
		for i in range(following.prev_pos.size()-1,0,-1):
			var p=following.prev_pos[i]
			tot_dist += p[0].distance_to(prev)
			if tot_dist >= trg_dist:
				trg=p
				break
			prev = p[0]
		if trg:
			global_position = trg[0]#global_position.move_toward(trg[0],.999)
			global_rotation = trg[1]


func _on_hitbox_area_entered(area):
	if area.is_in_group("Walls"):
		#bounce off walls
		bounce(area.name)

func bounce(n):
	if n=="WallT" or n=="WallB":
		velocity.y*=-1
		r = 2*PI - r
	if n=="WallL" or n=="WallR":
		velocity.x*=-1
		r = PI-r

func add_follower():
	if follower != null:
		follower.add_follower()
	else:
		var seg=Globals.unitObj.instantiate()
		get_parent().add_child(seg)
		follower=seg
		seg.index = index+1
		seg.following = self

func do_prev():
	prev_pos.append([global_position,global_rotation])
	if prev_pos.size() > 15:
		prev_pos.remove_at(0)
	await get_tree().create_timer(0.01).timeout
	do_prev()
