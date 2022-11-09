extends Resource
class_name QuizQuestionen

enum QuestionType {TEXT, IMAGE, VIDEO, AUDIO }

export(String) var questionInfo
export(QuestionType) var type
export(Texture) var questionImage
export(AudioStream) var questionAudio
export(VideoStream) var questionVideo
export(Array, String) var options
export(String) var correct
