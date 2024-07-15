class_name CardStateMachine
extends Node

@export var initial_state: CardState

var current_state: CardState
var states:= {}

func init(card: CardUI) -> void:
	for card_state in get_children():
		if card_state is CardState:
			states[card_state.state] = card_state
			card_state.transition_requested.connect(_on_transition_requested)
			card_state.card_ui = card
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state
		
func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)
		
func on_gui_input(event: InputEvent) -> void:
	if (current_state):
		current_state.on_gui_input(event)
		
func on_mouse_entered() -> void:
	if (current_state):
		current_state.on_mouse_entered()
		
func on_mouse_exited() -> void:
	if (current_state):
		current_state.on_mouse_exited()
		
func _on_transition_requested(from: CardState, to: CardState.State) -> void:
	if from != current_state:
		return
		
	var new_state: CardState = states[to]
	if not new_state:
		return
	
	if current_state:
		current_state.exit()
		
	new_state.enter()
	current_state = new_state
