class_name TrueStrengthFormStatus
extends Status

const MUSCLE_STATUS = preload("res://statuses/muscle.tres")

var stacks_per_turn := 2

func apply_status(target: Node) -> void:
	print("Applied true strength form")
	
	var status_effect := StatusEffect.new()
	var muscle := MUSCLE_STATUS.duplicate()
	muscle.stacks = stacks_per_turn
	status_effect.status = muscle
	status_effect.execute([target])
	
	status_applied.emit(self)
