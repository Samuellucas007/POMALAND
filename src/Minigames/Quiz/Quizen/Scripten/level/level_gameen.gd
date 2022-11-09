extends Node

enum QuestionType {TEXT, IMAGE, VIDEO, AUDIO}

export(Resource) var bdQuiz
export(Color) var colorRight
export(Color) var colorWrong

var buttons := []
var index := 0
var quizShuffle := []
var correct := 0

onready var questionText := $Question_infoen/txtQuestionen
onready var questionImage := $Question_infoen/Panelen/Question_imageen
onready var questionVideo := $Question_infoen/Panelen/Question_videoen
onready var questionAudio := $Question_infoen/Panelen/Question_Audioen

func _ready():
	for _button in $Question_holderen.get_children():
		buttons.append(_button)

	quizShuffle = randomizeArray(bdQuiz.bd)
	loadQuiz()


func loadQuiz() -> void:
	
	if index >= bdQuiz.bd.size():
		gameOver()
		return
	questionText.text = str(quizShuffle[index].questionInfo)
	
	var options = randomizeArray(bdQuiz.bd[index].options)
	randomize()
	options.shuffle()
	for i in buttons.size():
		buttons[i].text = str(bdQuiz.bd[index].options[i])
		buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])

	match bdQuiz.bd[index].type:
		QuestionType.TEXT:
			$Question_infoen/Panelen.hide()

		QuestionType.IMAGE:
			$Question_infoen/Panelen.show()
			questionImage.texture = bdQuiz.bd[index].questionImage
			#questionImage.texture = bdQuiz.bd[index].questionImage
			
		QuestionType.VIDEO:
			$Question_infoen/Panelen.show()
			questionVideo.stream = bdQuiz.bd[index].questionVideo
			questionVideo.play()
			
		QuestionType.AUDIO:
			$Question_infoen/Panelen.show()
			questionImage.texture = load("res://sprites/sound.png")
			questionAudio.stream = bdQuiz.bd[index].questionAudio
			questionAudio.play()

func buttons_answer(button) -> void:
	print(button.text)
	if bdQuiz.bd[index].correct == button.text:
		button.modulate = colorRight
		correct += 1
	else:
		button.modulate = colorWrong

	questionAudio.stop()
	questionVideo.stop()
	
	yield(get_tree().create_timer(1), "timeout")
	for bt in buttons:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "buttons_answer")
		
	questionAudio.stream = null
	questionVideo.stream = null
	index += 1
	loadQuiz()
	
func randomizeArray(array: Array) -> Array:
	randomize()
	var arrayTemp:= array
	arrayTemp.shuffle()
	return arrayTemp


func gameOver() -> void:
	if correct == 4:
		$FimEN.show()
		$FimEN/Label.text = ("You got 4/4")
	else:
		$CanvasLayerEN.show()



func _on_ButtonRetry_pressed():
	TransitionScreen.fadeIn("res://Minigames/Quiz/Quizen/Scenesen/Quiz.tscn")

func _on_Button_pressed():
	TransitionScreen.fadeIn("res://Scenes/Credits.tscn")
