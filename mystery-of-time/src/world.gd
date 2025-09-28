extends Node2D

@onready var upButton = $upButton;
@onready var downButton = $downButton;
@onready var pondBackground = $pondBackground;
@onready var storeBackground = $storeBackground;
#!!!Needs to be pickable for input_event to work!!!
@onready var fishbowl = $fishbowl;
@onready var fisher = $fisher;
#!!!Needs to be pickable for input_event to work!!!
@onready var backgroundNum = 0;
@onready var backgroundList = [pondBackground, storeBackground];
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pondBackground.show();
	storeBackground.hide();
	upButton.show();
	downButton.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_up_button_pressed() -> void:
	print("up")
	backgroundList[backgroundNum].hide();
	backgroundList[backgroundNum+1].show();
	backgroundNum += 1;
	if (backgroundNum == backgroundList.size() - 1) :
		upButton.hide();
	downButton.show();

func _on_down_button_pressed() -> void:
	print("down")
	backgroundList[backgroundNum].hide();
	backgroundList[backgroundNum-1].show();
	backgroundNum -= 1;
	if (backgroundNum == 0) :
		downButton.hide();
	upButton.show();
