extends CharacterBody2D
#Fishbowl Item Interactable

@onready var spriteNode = $Sprite2D
@onready var collisionNode = $CollisionShape2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# When clicked on
	if event.is_action_pressed("click"):
		spriteNode.hide();
		collisionNode.hide();
			
		
