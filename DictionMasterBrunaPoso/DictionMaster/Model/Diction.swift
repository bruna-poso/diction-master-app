import Foundation

struct Diction: Codable {
    var word: String
    var phonetics: [DictionPhonetics]
    var meanings: [DictionMeanings]
}

struct DictionPhonetics: Codable {
    var text: String?
    var audio: String
}

struct DictionMeanings: Codable {
    var partOfSpeech: String
    var definitions: [DictionDefinitions]
}

struct DictionDefinitions: Codable {
    var definition: String
    var example: String?
}
