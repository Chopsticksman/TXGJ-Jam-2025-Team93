extends Node2D

@onready var upButton = $upButton;
@onready var pondBackground = $pondBackground;
@onready var storeBackground = $storeBackground;
@onready var backgroundNum = 0;
@onready var backgroundList = [pondBackground, storeBackground];
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pondBackground.show();
	storeBackground.hide();
	upButton.show();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_up_button_pressed() -> void:
	backgroundList[backgroundNum].hide();
	backgroundList[backgroundNum+1].show();
	backgroundNum += 1;
	if (backgroundNum == backgroundList.size() - 1) :
		upButton.hide();
	


func _on_down_button_pressed() -> void:
	pass # Replace with function body.
