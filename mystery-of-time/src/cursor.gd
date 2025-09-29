extends Node2D

@export var interact_anim: Array;
@export var cursor: Texture2D;
@export var frameDelay: float = 0.1;
@onready var parent:Node = get_parent();
#0 = normal, 1 = interactive
@onready var mouseMode := 0;
@onready var timer := 0.0;
@onready var frame = 0;

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	Input.set_custom_mouse_cursor(cursor);

func _process(delta: float) -> void:
	timer += delta;
	if (timer >= frameDelay):
		timer = 0.0;
		frame = (frame + 1) % interact_anim.size();
		#Check if item is being hovered
		if (parent.getHovering()):
			print("Hovering")
			mouseMode = 1;
		else:
			mouseMode = 0;
	if (mouseMode == 0):
		frame = 0;
		Input.set_custom_mouse_cursor(cursor);
	elif (mouseMode == 1):
		Input.set_custom_mouse_cursor(interact_anim[frame], Input.CURSOR_ARROW, Vector2(20, 20));
