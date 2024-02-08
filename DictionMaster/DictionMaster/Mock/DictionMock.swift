import Foundation

class DictionMock {
    static func getMockDiction() -> [Diction] {
        let phonetics1 = [
            DictionPhonetics(text: nil, audio: "https://api.dictionaryapi.dev/media/pronunciations/en/hello-au.mp3"),
            DictionPhonetics(text: "/həˈləʊ/", audio: "https://api.dictionaryapi.dev/media/pronunciations/en/hello-uk.mp3"),
            DictionPhonetics(text: "/həˈloʊ/", audio: "")
        ]

        let meanings1 = [
            DictionMeanings(partOfSpeech: "noun", definitions: [
                DictionDefinitions(definition: "\"Hello!\" or an equivalent greeting.", example: nil)
            ]),
            DictionMeanings(partOfSpeech: "verb", definitions: [
                DictionDefinitions(definition: "To greet with \"hello\".", example: nil)
            ]),
            DictionMeanings(partOfSpeech: "interjection", definitions: [
                DictionDefinitions(definition: "A greeting (salutation) said when meeting someone or acknowledging someone’s arrival or presence.", example: Optional("Hello, everyone.")),
                DictionDefinitions(definition: "A greeting used when answering the telephone.", example: Optional("Hello? How may I help you?")),
                DictionDefinitions(definition: "A call for response if it is not clear if anyone is present or listening, or if a telephone conversation may have been disconnected.", example: Optional("Hello? Is anyone there?")),
                DictionDefinitions(definition: "Used sarcastically to imply that the person addressed or referred to has done something the speaker or writer considers to be foolish.", example: Optional("You just tried to start your car with your cell phone. Hello?")),
                DictionDefinitions(definition: "An expression of puzzlement or discovery.", example: Optional("Hello! What’s going on here?"))
            ])
        ]

        let diction1 = Diction(word: "hello", phonetics: phonetics1, meanings: meanings1)

        return [diction1]
    }
}
