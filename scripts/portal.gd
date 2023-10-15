extends Node3D

@export var id:int
@export var stage_id:int
@export var stage_portal_id:int

@export var spawn_point:Node3D

func _on_area_3d_body_entered(body):
	StageManager.teleport(stage_id,stage_portal_id)
	body.lock_direction()
