class_name AetherActionRouter
extends Node

## Shared action router. It keeps the two embodiments isolated.
@export var horizon_body: Node
@export var openai_body: Node

func route(source: String, action: String, args: Array = []) -> bool:
    var body: Node = null
    if source == "horizon":
        body = horizon_body
    elif source == "openai":
        body = openai_body
    else:
        return false
    if body == null or not body.has_method("execute_action"):
        return false
    body.execute_action(action, args)
    return true

func parse_action_line(source: String, line: String) -> bool:
    if not line.begins_with("ACTION:"):
        return false
    var command := line.trim_prefix("ACTION:").strip_edges()
    var parts := command.split(" ", false)
    if parts.is_empty():
        return false
    var action := parts[0]
    var args: Array = []
    for i in range(1, parts.size()):
        args.append(parts[i])
    return route(source, action, args)
