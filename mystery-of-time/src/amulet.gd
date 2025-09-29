extends CharacterBody2D
#Fishbowl Item Interactable

@onready var spriteNode:Node = $Sprite2D
@onready var collisionNode:Node = $CollisionShape2D
@onready var isHidden: bool = false;
@onready var isClicked: bool = false;
@onready var isHovered: bool = false;
@onready var parent: Node = get_parent();
	
#Add var to 2 list fields and as a node in world, enable pickable, connect 2 funcs on nodes, add to world
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (!isClicked):
		isHovered = true;
	# When clicked on
	if event.is_action_pressed("click"):
		if (!isClicked && !parent.talking && !parent.justTalked):
			isClicked = true;
			var invNum = parent.getInvNum();
			if (invNum != -1):
				parent.addToInv(self);
			else:
				return;
			spriteNode.hide();
			collisionNode.hide();
			var newPos = Vector2(262 + invNum*70, 607);
			position = newPos;
			spriteNode.show();
			collisionNode.show();
		else:
			if (!isHidden):
				if (parent.talking || parent.justTalked):
					parent.justTalked = false;
					parent.useItem(self);
			
func _on_mouse_exited() -> void:
	isHovered = false;
