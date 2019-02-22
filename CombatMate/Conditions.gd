extends Node2D

onready var pressed_time = 0
onready var isPressed = false
onready var turns1 = 0
onready var turns2 = 0
onready var turns3 = 0

signal input_popup(currentNode, childNode)

# Called when the node enters the scene tree for the first time.
func _ready():
	var inputPopup = get_parent().get_node("InputPopup")
	self.connect("input_popup", inputPopup, "_enter_value")

func _process(delta):
	if (isPressed):
		pressed_time += delta

func _on_Turns_new_turn():
	turns1 = int(get_node("Turns1").get_text())
	if (get_node("Turns1").get_text() != "00"):
		if (turns1 <= 1):
			get_node("Turns1").set_text("0")
			get_node("Desc1").set_text("")
		else:
			get_node("Turns1").set_text(String(turns1-1))
		
	turns2 = int(get_node("Turns2").get_text())
	if (get_node("Turns2").get_text() != "00"):
		if (turns2 <= 1):
			get_node("Turns2").set_text("0")
			get_node("Desc2").set_text("")
		else:
			get_node("Turns2").set_text(String(turns2-1))
		
	turns3 = int(get_node("Turns3").get_text())
	if (get_node("Turns3").get_text() != "00"):	
		if (turns3 <= 1):
			get_node("Turns3").set_text("0")
			get_node("Desc3").set_text("")
		else:
			get_node("Turns3").set_text(String(turns3-1))

func changed_value(value, child):
	if (value == ""):
		return
	get_node(child).set_text(value)

func _on_turns_btn1_button_down():
	isPressed = true
	pass # Replace with function body.

func _on_turns_btn1_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		get_node("Turns1").set_text("0")
		get_node("Desc1").set_text("")
	else:
		emit_signal("input_popup", self.get_path(), "Turns1")
	pressed_time = 0
	pass # Replace with function body.

func _on_desc_btn1_pressed():
	emit_signal("input_popup", self.get_path(), "Desc1")

func _on_turns_btn2_button_down():
	isPressed = true
	pass # Replace with function body.

func _on_turns_btn2_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		get_node("Turns2").set_text("0")
		get_node("Desc2").set_text("")
	else:
		emit_signal("input_popup", self.get_path(), "Turns2")
	pressed_time = 0
	pass # Replace with function body.

func _on_desc_btn2_pressed():
	emit_signal("input_popup", self.get_path(), "Desc2")

func _on_turns_btn3_button_down():
	isPressed = true
	pass # Replace with function body.

func _on_turns_btn3_button_up():
	isPressed = false
	if (pressed_time > 0.4):
		get_node("Turns3").set_text("0")
		get_node("Desc3").set_text("")
	else:
		emit_signal("input_popup", self.get_path(), "Turns3")
	pressed_time = 0
	pass # Replace with function body.

func _on_desc_btn3_pressed():
	emit_signal("input_popup", self.get_path(), "Desc3")
