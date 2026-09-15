# API Key Contract

## Rule
No OpenAI API key may be committed to this repository, embedded in source code, or included in an asset.

## Runtime configuration
The Godot OpenAI bridge reads credentials from a local runtime configuration such as:
- `user://horizon_openai.cfg`
- environment/runtime secret injection

## Required fields
```ini
[openai]
api_key=<LOCAL_SECRET>
model=<MODEL>
tts_model=<TTS_MODEL>
```

The repository contains only this contract and never the secret value.
