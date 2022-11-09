extends Node
#Dictionary that directs the texts acording to the selected language to different lists containing the lines of menguzzi
var meneguzziTalk = {
	"english": textenMeneguzzi,
	"portuguese": textportMeneguzzi
}
#consts that store the hint variables in english
const textenMoveHint = "Hint: Use\n↑ ← ↓ →\nto move around"
const textenInteractHint = "Hint Use\n(Z)\nto interact"
#consts that store the hint variables in portuguese
const textportMoveHint = "Dica: Use\n↑ ← ↓ →\npara se mover"
const textportInteractHint = "Dica: Use\n(Z)\npara interagir"


#const structured in a form of a list to store the lines of meneguzzi in english
const textenMeneguzzi = [
	"null",
	"(Meneguzzi): Aahh, quick! here!. I don't have much time….",
	"(Cleiton): What happened? Where is everyone?",
	"(Meneguzzi): Everyone was infected with the\n mpj-1 virus and as far as I know, we are the\n only survivors…",
	"(Cleiton): The only survivors!?\n Wow... That's awful!",
	"(Meneguzzi): You... You, MUST FIND THE CURE!",
	"(Cleiton): What kind of cure for something\n like that?",
	"(Meneguzzi): POMA",
	"(Cleiton): POMA? What does this mean?",
	"(Meneguzzi): Product Operation Maturity\n Assessment, a model created by Dell and it\n is the cure!!!",
	"(Cleiton): Where can I find it?",
	"(Meneguzzi): The antidote can only be\n created if you pass through the 3 floors of Dell\n headquarters and master it's 9 competences",
	"(Meneguzzi): Here is a quick reminder: Use the red mats to access the other floors",
	"(Meneguzzi): PROMISE ME YOU WILL SAVE\n EVERYONE. BEST OF LUCK!"
]
#const structured in a form of a list to store the lines of meneguzzi in portuguese
const textportMeneguzzi = [
	"null",
	"(Meneguzzi): Aahh, rápido! aqui!. eu não tenho muito tempo.",
	"(Cleiton): O que aconteceu? Onde está todo mundo?",
	"(Meneguzzi): Todo mundo foi infectado pelo\n vírus mpj-1 e até onde eu sei, nós\n somos os últimos sobreviventes...",
	"(Cleiton): Os últimos sobreviventes!?\n Nossa... Que horror!",
	"(Meneguzzi): Você... Você DEVE ACHAR A CURA!",
	"(Cleiton): Que tipo de cura para algo\n deste tipo?:",
	"(Meneguzzi): POMA",
	"(Cleiton): POMA? O que isso significa?",
	"(Meneguzzi): Product Operation Maturity\n Assessment, Um modelo criado pela Dell...\n Isso é a cura!!!",
	"(Cleiton): Ótimo, onde posso encontra-la?",
	"(Meneguzzi): O antidoto só pode ser criado,\n se você passar pelos 3 andares da dell\n e compreender as suas 9 competências.",
	"(Meneguzzi): Aqui está um lembrete: vá até\n os tapetes vermelhos e acesse os outros\n andares.",
	"(Meneguzzi): ME PROMETA QUE VOCÊ IRÁ SALVAR \n A TODOS. BOA SORTE"
]
