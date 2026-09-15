class_name AetherOpenAI
extends Node3D

## OpenAI teacher/peer embodiment. Never writes Horizon memory directly.
signal observation_ready(observation: Dictionary)
signal speech_requested(text: String)
signal action_proposed(line: String)

@export var model := "gpt-5.6-luna"
@export var tts_model := "gpt-4o-mini-tts"
var conversation_history: Array[Dictionary] = []
var api_key := ""

func load_runtime_config() -> void:
    var cfg := ConfigFile.new()
    if cfg.load("user://horizon_openai.cfg") == OK:
        api_key = str(cfg.get_value("openai", "api_key", ""))
        model = str(cfg.get_value("openai", "model", model))
        tts_model = str(cfg.get_value("openai", "tts_model", tts_model))

func test_connection() -> bool:
    return not api_key.is_empty()

func teach(prompt: String, context: Dictionary = {}) -> void:
    var message := {"role":"user", "content":prompt, "context":context}
    conversation_history.append(message)
    # HTTP implementation is intentionally separated from the embodiment.
    # The response handler should call receive_response().

func receive_response(text: String) -> void:
    conversation_history.append({"role":"assistant", "content":text})
    for line in text.split("\n"):
        if line.begins_with("ACTION:"):
            action_proposed.emit(line.strip_edges())
        elif line.begins_with("SPEAK:"):
            speech_requested.emit(line.trim_prefix("SPEAK:").strip_edges())

func proactive_lesson(topic: String, context: Dictionary = {}) -> void:
    teach("Teach Horizon about: " + topic, context)

func submit_observation(raw_sensors: Dictionary) -> void:
    observation_ready.emit({"source":"aether_openai", "timestamp":Time.get_ticks_msec(), "sensors":raw_sensors})
