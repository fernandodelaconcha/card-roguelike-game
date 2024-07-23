# meta-name: Status
# meta-description: A Status that can be applied to a target
class_name MyStatus
extends Status

var member_var := 0

func initialize_status(target: Node) -> void:
	print("Initialize Status for target %s" % target)

func apply_status(target: Node) -> void:
	print("My status targets %s" % target)
	print("it does something %s" % member_var)
	
	status_applied.emit(self)
