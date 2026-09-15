# AETHER Embodiment Contract

## Purpose
Defines the shared physical interface used by both AETHER embodiments in Godot.

## Separation
- `AETHER_Horizon` is the Horizon embodiment and receives commands from Horizon Core.
- `AETHER_OpenAI` is the OpenAI teacher/peer embodiment and receives commands only from the OpenAI bridge.
- The two agents are separate runtime identities even though they use the same original AETHER rig/asset.
- Godot owns body physics, animation playback, sensors, spatial audio, room interaction and transport only.
- Semantic interpretation, reasoning, memory and learning remain outside the embodiment layer.

## Perception
Raw observations may include:
- vision ray/occlusion measurements
- proprioception/joint state
- tactile/contact measurements
- audio measurements
- body/world pose
- object transforms supplied by the simulation

Godot must not assign object identity, intent, emotion or semantic meaning to raw sensor data.

## Actions
Supported action vocabulary:
- `LOOK_AT(target)`
- `MOVE_TO(target)`
- `STOP()`
- `WAVE()`
- `TOUCH(target)`
- `PICK_UP(target)`
- `DROP(target)`
- `SPEAK(text)`
- `PLAY_ANIMATION(name)`

Actions are requests; physics and collision determine whether execution succeeds.

## Safety
No embodiment may directly mutate Horizon memory. OpenAI may teach or propose actions, but Horizon Core remains authoritative for Horizon state and learning.
