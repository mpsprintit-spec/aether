# AETHER Horizon Contract

## Identity
`AETHER_Horizon` is the embodied interface for Horizon Core. It is not a second intelligence.

## Input
Horizon Core may send:
- motor/action commands
- gaze targets
- navigation targets
- manipulation requests
- speech output
- animation requests
- enable/disable actuator state

## Output
AETHER_Horizon returns:
- timestamped raw sensor observations
- body pose and joint state
- action execution status
- collision/contact status
- speech playback status
- animation status

## Learning boundary
Horizon Core owns DNF, memory, perception interpretation, reasoning, planning and learning. The Godot embodiment never writes directly into those systems.

## Runtime endpoint
Transport is implementation-dependent. The canonical message envelope is:
```json
{
  "source":"horizon_core",
  "target":"aether_horizon",
  "type":"action",
  "timestamp":0,
  "payload":{}
}
```
