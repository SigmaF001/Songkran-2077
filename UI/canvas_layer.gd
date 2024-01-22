extends CanvasLayer

var display_food

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.want_food == "Tomyumkung":
		display_food = preload("res://Asset/Item/Tomyumkung.png")
		$TextureRect.texture = display_food
	else:
		display_food = preload("res://Asset/Item/Tomyumkung.png")
		$TextureRect.texture = display_food
	
