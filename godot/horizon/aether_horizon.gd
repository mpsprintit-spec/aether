class_name AetherHorizon
extends Node3D

## Horizon embodiment adapter. Intelligence stays in Horizon Core.
signal observation_ready(observation: Dictionary)
signal action_finished(action: String, success: bool)

var joint_state: Dictionary = {}
var actuator_enabled := false

func _ready() -> void:
    _initialize_joint_state_from_imported_pose()
    actuator_enabled = false

func _initialize_joint_state_from_imported_pose() -> void:
    # Preserve imported AETHER pose; do not overwrite bone rotations with zero.
    joint_state = {"root": "imported_pose", "pelvis": "imported_pose", "chest": "imported_pose", "head": "imported_pose"}

func enable_joint_actuator(enabled: bool) -> void:
    actuator_enabled = enabled

func execute_action(action: String, args: Array = []) -> void:
    match action:
        "LOOK_AT": _look_at(args)
        "MOVE_TO": _move_to(args)
        "STOP": _stop()
        "WAVE": _wave()
        "TOUCH": _touch(args)
        "PICK_UP": _pick_up(args)
        "DROP": _drop(args)
        "SPEAK": _speak(args)
        "PLAY_ANIMATION": _play_animation(args)
        _: action_finished.emit(action, false); return
    action_finished.emit(action, true)

func publish_observation(raw_sensors: Dictionary) -> void:
    observation_ready.emit({"source":"aether_horizon", "timestamp":Time.get_ticks_msec(), "sensors":raw_sensors})

func _look_at(_args: Array) -> void: pass
func _move_to(_args: Array) -> void: pass
func _stop() -> void: pass
func _wave() -> void: pass
func _touch(_args: Array) -> void: pass
func _pick_up(_args: Array) -> void: pass
func _drop(_args: Array) -> void: pass
func _speak(_args: Array) -> void: pass
func _play_animation(_args: Array) -> void: pass
