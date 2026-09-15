# AETHER Dual-Embodiment Architecture

```text
                 ┌─────────────────────┐
                 │     GODOT WORLD     │
                 │ physics / sensors  │
                 │ room / audio / UI  │
                 └──────────┬──────────┘
                            │ transport
              ┌─────────────┴─────────────┐
              │                           │
     ┌────────▼────────┐        ┌────────▼────────┐
     │ AETHER_Horizon  │        │  AETHER_OpenAI  │
     │ embodiment only │        │ teacher / peer  │
     └────────┬────────┘        └────────┬────────┘
              │                           │
     ┌────────▼────────┐        ┌────────▼────────┐
     │  Horizon Core   │        │   OpenAI API    │
     │ DNF + memory +  │        │ conversation +  │
     │ reasoning/learn │        │ teaching        │
     └─────────────────┘        └─────────────────┘
```

## Shared AETHER functions retained
- original imported skeleton pose preservation
- joint actuator enable/disable
- LOOK_AT
- MOVE_TO
- STOP
- WAVE
- TOUCH
- PICK_UP
- DROP
- SPEAK
- PLAY_ANIMATION
- raw observation publishing
- spatial audio
- OpenAI conversation history
- proactive lessons
- `ACTION:` routing
- runtime API-key configuration

## Asset rule
Use the original AETHER GLB and duplicate it as two separate runtime assets:
- `assets/AETHER_Horizon.glb`
- `assets/AETHER_OpenAI.glb`

Do not re-rig the model. Both copies retain the original 18-joint rig and baked animations.

## Security
The API key is runtime-only and is never stored in Git.
