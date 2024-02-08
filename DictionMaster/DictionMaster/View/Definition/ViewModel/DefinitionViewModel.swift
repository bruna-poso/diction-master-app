import Foundation

struct DefinitionItem {
    let globalIndex: Int
    let partOfSpeech: String
    let definition: String
    let example: String?
}

class DefinitionViewModel: ObservableObject {
    @Published var diction: [Diction] = []
    
    init(diction: [Diction]) {
        self.diction = diction
    }

    var displayItems: [DefinitionItem] {
        var items: [DefinitionItem] = []
        
        print(diction)
        
        if !diction.isEmpty {
            for (meaningIndex, meaning) in diction[0].meanings.enumerated() {
                for (definitionIndex, definition) in meaning.definitions.enumerated() {
                    let totalDefinitionsBefore = diction[0].meanings[0..<meaningIndex].reduce(0) { $0 + $1.definitions.count }
                    let globalIndex = totalDefinitionsBefore + definitionIndex + 1
                    
                    let displayItem = DefinitionItem(
                        globalIndex: globalIndex,
                        partOfSpeech: meaning.partOfSpeech,
                        definition: definition.definition,
                        example: definition.example
                    )
                    
                    items.append(displayItem)
                }
            }
        }

        return items
    }
    
    func calculateGlobalIndex(forMeaningIndex meaningIndex: Int, andDefinitionIndex definitionIndex: Int) -> Int {
        let meanings = diction[0].meanings
        let totalDefinitionsBefore = meanings[0..<meaningIndex].reduce(0) { $0 + $1.definitions.count }
        let globalIndex = totalDefinitionsBefore + definitionIndex + 1
        return globalIndex
    }

    func getWord() -> String {
        for item in diction {
            return item.word.capitalized
        }
        return ""
    }
    
    func getPhonetic() -> [DictionPhonetics] {
        for item in diction {
            return item.phonetics
        }
        return []
    }
}

