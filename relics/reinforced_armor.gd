class_name ReinforcedArmor
extends Relic

@export var block_bonus := 3

func activate_relic(owner: RelicUI) -> void:
	var player := owner.get_tree().get_first_node_in_group("player")
	var block_effect := BlockEffect.new()
	block_effect.amount = block_bonus
	block_effect.execute([player])
	
	owner.flash()

func get_tooltip() -> String:
	return tooltip % block_bonus

