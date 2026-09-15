class_name RoomAudioContract
extends Node

## Spatial audio contract: each AETHER speaks from its own 3D position.
@export var openai_player: AudioStreamPlayer3D
@export var horizon_player: AudioStreamPlayer3D
@export var tv_player: AudioStreamPlayer3D

func speak_openai(stream: AudioStream) -> void:
    if openai_player:
        openai_player.stream = stream
        openai_player.play()

func speak_horizon(stream: AudioStream) -> void:
    if horizon_player:
        horizon_player.stream = stream
        horizon_player.play()

func play_tv(stream: AudioStream) -> void:
    if tv_player:
        tv_player.stream = stream
        tv_player.play()
