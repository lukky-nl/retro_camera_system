extends Node3D

@export var portals:Array[Node3D] = []
@export var player:CharacterBody3D

func _ready():
	StageManager.new_scene_loaded(portals,player)
