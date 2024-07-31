class_name PauseMenu
extends CanvasLayer

signal save_and_quit

@onready var back_button: Button = %BackButton
@onready var save_button: Button = %SaveButton

func _ready() -> void:
	back_button.pressed.connect(_unpause)
	save_button.pressed.connect(_on_save_button_pressed)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if visible:
			_unpause()
		else:
			_pause()
			
		get_viewport().set_input_as_handled()

func _pause() -> void:
	show()
	get_tree().paused = true

func _unpause() -> void:
	hide()
	get_tree().paused = false

func _on_save_button_pressed() -> void:
	get_tree().paused = false
	save_and_quit.emit()
