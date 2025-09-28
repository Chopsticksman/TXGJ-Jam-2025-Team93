extends CharacterBody2D
#Sand fisher NPC Interactable

@onready var spriteNode = $Sprite2D
@onready var collisionNode = $CollisionShape2D
@onready var isHidden = false;
@onready var talkCount = 0;
@onready var parent = get_parent();

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# When clicked on
	if event.is_action_pressed("click"):
		parent.startTalking(self);
			
func startSpeak():
	talkCount = 1;
	print("Howdy");
	#Start
	
func contSpeak():
	if (talkCount != 2):
		print("Cowabunga");
		talkCount += 1;
	else:
		parent.stopTalking();
	#Next dialogue option

func use(item: Node) -> bool:
	if (item == get_node("../meat")):
		print("Om nom nom");
		return true;
	else:
		return false;
		
