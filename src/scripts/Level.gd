extends Spatial

onready var navmesh = $NavigationMeshInstance;
onready var map = $NavigationMeshInstance/Map;

var Player = preload("res://src/Player.tscn");
var Enemy = preload("res://src/Enemy.tscn");
var Box = preload("res://src/ItemBox.tscn");

var player: KinematicBody;
var enemy: KinematicBody;

func _ready():
	var room_ammount = map.ROOM_AMOUNT;
	var room_size = map.ROOM_SIZE;
	var rooms = map.rooms;
	var box_pos = Vector3(rooms[1].x-int(map.WIDTH/2), 0.25, rooms[1].y-int(map.HEIGHT/2));

	navmesh.bake_navigation_mesh(false);

	player = Player.instance();
	enemy = Enemy.instance();
	var box = Box.instance();

	player.set_pos(map.start_room);
	enemy.set_pos(map.end_room);

	add_child(player);
	#add_child(enemy);
	
	box.transform.origin = box_pos;
	add_child(box);


func _physics_process(_delta):
	var loc = player.global_transform.origin;
	#enemy.call_deferred("set_target", loc);
