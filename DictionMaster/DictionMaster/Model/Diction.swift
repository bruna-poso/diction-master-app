import Foundation

struct Diction: Decodable {
    let word: String
    let phonetic: String
    let phonetics: [DictionPhonetics]
    let meanings: [DictionMeanings]
}

struct DictionPhonetics: Decodable {
    let text: String?
    let audio: String?
}

struct DictionMeanings: Decodable {
    let partOfSpeech: String
    let definitions: [DictionDefinitions]
}

struct DictionDefinitions: Decodable {
    let definition: String?
    let example: String?
}
