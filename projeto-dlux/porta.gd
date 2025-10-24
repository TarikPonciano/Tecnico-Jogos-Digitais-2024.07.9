extends Area2D

@export var minimo_cerejas: int
@export var proxima_fase: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("closed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if %"Personagem V 2".cerejas >= minimo_cerejas:
		$AnimatedSprite2D.play("open")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Personagem V 2":
		if $AnimatedSprite2D.animation == "open":
			get_tree().change_scene_to_packed(proxima_fase)
