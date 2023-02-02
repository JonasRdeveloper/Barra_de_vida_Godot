extends ProgressBar

var Saude : float = 100.0
signal Saude_esgotada(Valor_antigo, Valor_novo)


func _process(_delta):
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'value', Saude, 0.5)
	
	if Input.is_action_just_pressed("ui_accept"):
		Tomar_dano(10)


func Tomar_dano(quantidade):
	var Valor_antigo = Saude
	Saude -= quantidade
	if Saude <= 0:
		emit_signal("Saude_esgotada", Valor_antigo, Saude)
		print("Infelizmente você morreu!")
		


func _on_Tomando_dano_body_entered(body):
	if body.is_in_group('Antagonistas'):
		Tomar_dano(10)

