extends EnemyAction

@export var block := 4

func perform_action() -> void:
	if not enemy or not target:
		return
	
	var block_effect := BlockEffect.new()
	block_effect.amount = block
	block_effect.sound = sound
	block_effect.execute([enemy])
	
	get_tree().create_timer(0.6, false).timeout.connect(
		func():
			Events.enemy_action_completed.emit(enemy)
	)

func update_intent_text() -> void:
	var player := target as Player
	if not player:
		return
	
	intent.current_text = intent.base_text % block
