extends Node

var stages = [preload("res://scenes/world.tscn"),preload("res://scenes/world_2.tscn"),preload("res://scenes/world_3.tscn")]

var current_stage_id = 0
var next_stage_id = 0
var next_portal_id = 0

var player:CharacterBody3D

var fade_speed = 2.0

var fade_out_timer = 1.0
var fade_in_timer = 1.2

var fading_out = false;
var fading_in = false

func _process(delta):
	if fading_out:
		fade_out_timer -= delta*fade_speed
		player.fade.color = Color(0,0,0,1.0-fade_out_timer)
		if fade_out_timer <= 0.0:
			get_tree().change_scene_to_packed(stages[next_stage_id])
			fade_out_timer = 1.0
			fading_out = false
			
	if fading_in:
		player.fade.color = Color(0,0,0,fade_in_timer)
		fade_in_timer -= delta
		if fade_in_timer <= 0.0:
			fading_in = false
			fade_in_timer = 1.2

func teleport(stage_id,portal_id):
	next_stage_id = stage_id
	next_portal_id = portal_id
	
	if fading_in:
		fade_out_timer = fade_in_timer
		fading_in = false
		
	fading_out = true;


func new_scene_loaded(portals,current_player):
	player = current_player;
	fading_in = true
	for portal in portals:
		if portal.id == next_portal_id:
			player.position = portal.spawn_point.global_position
	
