# Altar.gd
extends Area2D

# Define the required items
const REQUIRED_ITEMS = ["Item1", "Item2"]

# Signal to notify that the altar has been unlocked
signal altar_unlocked

# Track collected items
var collected_items = []

# Called when the player interacts with the altar
func _on_altar_body_entered(body):
	if body.has_method("has_item"):
		for item in REQUIRED_ITEMS:
			if body.has_item(item) and item not in collected_items:
				collected_items.append(item)
				if len(collected_items) == REQUIRED_ITEMS.size():
					emit_signal("altar_unlocked")
					unlock_altar()
					break

# Function to unlock the altar
func unlock_altar():
	print("The altar is now unlocked!")
	# Add your unlocking logic here (e.g., open a door, trigger an animation, etc.)
