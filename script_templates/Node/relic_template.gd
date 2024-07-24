# meta-name: Relic
# meta-description: A Relic that can be acquired by the player.
class_name MyRelic
extends Relic

@export var member_var := 0

func initialize_relic(_owner: RelicUI) -> void:
	print("Happens once when we gain a new relic")
	
func activate_relic(_owner: RelicUI) -> void:
	print("This happens at specific times basd on the Relic.Type property")

func deactivate_relic(_owner: RelicUI) -> void:
	print("this gets called when a RelicUI is exiting the SceneTree i.e. getting deleted")
	print("Event-based Relics should disconnect from EventBus here")

func get_tooltip() -> String:
	return tooltip
