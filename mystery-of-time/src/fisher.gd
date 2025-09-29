extends CharacterBody2D
#Sand fisher NPC Interactable

@onready var spriteNode: Sprite2D = $Sprite2D
@onready var collisionNode: CollisionShape2D = $CollisionShape2D
@onready var isHidden: bool = false;
@onready var isHovered: bool = false;
@onready var talkCount: int = 0;
@onready var collectNum: int = 0;
@onready var parent: Node2D = get_parent();
@onready var dialogue: RichTextLabel = get_node("../dialogue");
@onready var dialogueLines: Array = ["Hey stranger! Need something from me?"]

func _ready():
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (talkCount == 0):
		isHovered = true;
	# When clicked on
	if event.is_action_pressed("click"):
		parent.startTalking(self);
			
func startSpeak():
	collectNum = 0;
	isHovered = false;
	if (parent.invList.size() >= 3):
		for i in range(parent.invList.size()):
			if (parent.invList[i] == get_node("../meat") || parent.invList[i] == get_node("../fishbowl") ||
			 parent.invList[i] == get_node("../rope")):
				collectNum += 1;
				if (collectNum == 3):
					dialogue.clear();
					dialogue.add_text("Are... are you sure? It’s pretty deep, and I don’t even know
					 what's down there. If you don’t have the proper equipment, throwing yourself 
					into the pit would be a bad idea. You’ll need a way to breathe, an escape route,
					 and something to distract the fish. If you don’t have those, you’re going to get hurt.");
					talkCount += 1;
					for j in range(parent.invList.size()):
						if (parent.invList[j] == get_node("../meat") ||
						 parent.invList[j] == get_node("../fishbowl") ||
						 parent.invList[j] == get_node("../rope")):
							parent.invList[j].isHidden = true;
							parent.invList[j] = null;
							
					return;
		dialogue.clear();
		dialogue.add_text(dialogueLines[talkCount]);
		talkCount += 1;
		
func contSpeak():
	if (talkCount != 1):
		print("Cowabunga");
	else:
		parent.stopTalking();
		talkCount = 0;
	#Next dialogue option

func use(item: Node) -> bool:
	if (item == get_node("../meat")):
		print("Om nom nom");
		return true;
	else:
		return false;
		

func _on_mouse_exited() -> void:
	isHovered = false;
