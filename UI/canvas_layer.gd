extends CanvasLayer

var display_food
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.want_food == "Tomyum":
		display_food = preload("res://Asset/Item/Tomyum.png")
		$TextureRect.texture = display_food
	else:
		display_food = preload("res://Asset/Item/Tomyum.png")
		$TextureRect.texture = display_food
	
