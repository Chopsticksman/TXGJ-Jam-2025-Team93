extends Node2D
@onready var upButton = $upButton;
@onready var downButton = $downButton;
@onready var pondBackground = $pondBackground;
@onready var storeBackground = $storeBackground;
#!!!Needs to be pickable for input_event to work!!!
@onready var fishbowl = $fishbowl;
@onready var meat = $meat;
@onready var fisher = $fisher;
#!!!Needs to be pickable for input_event to work!!!
@onready var backgroundNum = 0;
#0 = POND, 1 = STORE, 
@onready var invList = []; #inventory list, size 10
@onready var backgroundList = [pondBackground, storeBackground];
@onready var pondList = [fishbowl, fisher];
@onready var storeList = [meat];
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	invList.resize(10);
	invList.fill(null);
	init();

func _on_up_button_pressed() -> void:
	print("up")
	backgroundNum += 1;
	init();

func _on_down_button_pressed() -> void:
	print("down")
	backgroundNum -= 1;
	init();
	
#Will return the first available inventory index, if all full will return -1
func getInvNum() -> int:
	for i in range(10):
		if (invList[i] == null):
			return i;
	return -1;
	
func addToInv(item: Node):
	invList[getInvNum()] = item;
		
func hideAll():
	upButton.hide();
	downButton.hide();
	pondBackground.hide();
	storeBackground.hide();
	fishbowl.hide();
	meat.hide();
	fisher.hide();
	
func init():
	hideAll();
	for i in range(10):
		if (invList[i] != null):
			invList[i].show();
	backgroundList[backgroundNum].show();
	if (backgroundNum == 0):
		for i in range(pondList.size()):
			if (pondList[i].isHidden == false):
				pondList[i].show();
	elif (backgroundNum == 1):
		for i in range(storeList.size()):
			if (storeList[i].isHidden == false):
				storeList[i].show();
	if (backgroundNum == backgroundList.size() - 1):
		downButton.show();
	elif (backgroundNum == 0):
		upButton.show();
	else:
		downButton.show();
		upButton.show();
	
