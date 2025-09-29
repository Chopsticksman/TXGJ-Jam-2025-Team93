extends Node2D
@onready var upButton = $upButton;
@onready var downButton = $downButton;
@onready var dialogueBox = $dialogueBox;
@onready var dialogue = $dialogue;
@onready var choice1 = $choice1;
@onready var choice2 = $choice2;
@onready var choice3 = $choice3;
@onready var choice4 = $choice4;
@onready var pondBackground = $pondBackground;
@onready var storeBackground = $storeBackground;
@onready var houseBackground = $houseBackground;
@onready var centerBackground = $centerBackground;
@onready var culturalsiteBackground = $culturalsiteBackground;
@onready var cursor = $cursor;
#!!!Needs to be pickable for input_event to work!!!
@onready var fishbowl = $fishbowl;
@onready var meat = $meat;
@onready var stopwatch = $stopwatch;
@onready var fisher = $fisher;
@onready var cow = $cow;
@onready var rope = $rope;
@onready var shell = $shell;
@onready var money = $money;
@onready var photograph = $photograph;
@onready var amulet = $amulet;
@onready var hammer = $hammer;
@onready var shovel = $shovel;
#!!!Needs to be pickable for input_event to work!!!
@onready var backgroundNum = 0;
@onready var talking = false;
@onready var talker;
@onready var justTalked = false;
#0 = POND, 1 = STORE, 
@onready var invList = []; #inventory list, size 10
@onready var backgroundList = [pondBackground, storeBackground, houseBackground,
centerBackground, culturalsiteBackground];
@onready var pondList = [fishbowl, fisher];
@onready var storeList = [meat, 
 photograph, hammer, shovel, amulet];
@onready var houseList = [rope, shell];
@onready var centerList = [hammer, money];
@onready var culturalsiteList = [stopwatch];
@onready var allItemList = [meat, fishbowl, stopwatch, fisher,
 photograph, hammer, shovel, amulet, cow]
#@onready var allItemList = [meat, fishbowl, stopwatch, fisher, cow,
 #rope, shell, money, photograph, amulet, hammer, shovel];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cursor.mouseMode = 0;
	invList.resize(10);
	invList.fill(null);
	init();

func _input(event):
	if event.is_action_pressed("click") || event.is_action_pressed("space"):
		if (talking): #if (inDialogue), go to next dialogue or finish
			talker.contSpeak();
		else:
			justTalked = false;
		

func _on_up_button_pressed() -> void:
	if (!talking):
		print("up")
		backgroundNum += 1;	
		init();

func _on_down_button_pressed() -> void:
	if (!talking):
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
	if (!talking):
		invList[getInvNum()] = item;

func startTalking(NPC: Node):
	if (!talking && !justTalked):
		talking = true;
		talker = NPC;
		NPC.startSpeak();
		init();
	
func stopTalking():
	talking = false;
	init();
	justTalked = true;
	
func useItem(item: Node):
	if (talker.use(item)):
		item.isHidden = true;
		invList[invList.find(item)] = null;
	init();
	
func getHovering() -> bool:
	for i in range(allItemList.size()):
		if (allItemList[i].isHovered):
			return true;
	return false;
	
func hideAll():
	upButton.hide();
	downButton.hide();
	dialogueBox.hide();
	dialogue.hide();
	choice1.hide();
	choice2.hide();
	choice3.hide();
	choice4.hide();
	for i in range(backgroundList.size()):
		backgroundList[i].hide();
	for i in range(allItemList.size()):
		allItemList[i].hide();
	
func init():
	hideAll();
	for i in range(10):
		if (invList[i]):
			invList[i].show();
	backgroundList[backgroundNum].show();
	if (backgroundNum == 0):
		for i in range(pondList.size()):
			if (!pondList[i].isHidden):
				pondList[i].show();
	elif (backgroundNum == 1):
		for i in range(storeList.size()):
			if (!storeList[i].isHidden):
				storeList[i].show();
	elif  (backgroundNum == 2):
		for i in range(houseList.size()):
			if (!houseList[i].isHidden):
				houseList[i].show();
	elif  (backgroundNum == 3):
		for i in range(centerList.size()):
			if (!centerList[i].isHidden):
				centerList[i].show();
	elif  (backgroundNum == 4):
		for i in range(culturalsiteList.size()):
			if (!culturalsiteList[i].isHidden):
				culturalsiteList[i].show();
	if (backgroundNum == backgroundList.size() - 1):
		downButton.show();
	elif (backgroundNum == 0):
		upButton.show();
	else:
		downButton.show();
		upButton.show();
	if (talking):
		dialogueBox.show();
		dialogue.show();
