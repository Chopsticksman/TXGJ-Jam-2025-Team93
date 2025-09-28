extends CharacterBody2D
#Fishbowl Item Interactable

@onready var spriteNode = $Sprite2D
@onready var collisionNode = $CollisionShape2D
@onready var isHidden = false;
@onready var isClicked = false;
@onready var parent = get_parent();

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
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
			
			
			
		
