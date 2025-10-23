extends Area2D
@export var proxima_fase:PackedScene
@export var minimo_cerejas:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("closed")
	#self.connect("body_entered", _on_body_entered)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if %"Personagem V 2".cerejas >= minimo_cerejas:
		$AnimatedSprite2D.play("open")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Personagem V 2":
		if $AnimatedSprite2D.animation == "open":
			get_tree().change_scene_to_packed(proxima_fase)
