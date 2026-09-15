# AETHER OpenAI Contract

## Identity
`AETHER_OpenAI` is an external teacher/peer embodiment controlled through the OpenAI bridge. It is separate from `AETHER_Horizon`.

## Capabilities
- conversational teaching
- language interaction
- proactive lesson generation
- action proposal/routing
- spatial speech through its room position
- observation-aware responses using supplied simulation context

## Action format
The bridge may emit machine-readable lines:
`ACTION: LOOK_AT target`
`ACTION: MOVE_TO target`
`ACTION: STOP`
`ACTION: WAVE`
`ACTION: TOUCH target`
`ACTION: PICK_UP target`
`ACTION: DROP target`

## Restriction
OpenAI AETHER cannot directly alter Horizon DNF, memory, learned weights or internal state. Teaching is delivered as observations/dialogue/action proposals; Horizon Core decides what is learned or executed.
