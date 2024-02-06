import Foundation
import SwiftUI

class DictionViewModel: ObservableObject {
    @Published var diction: [Diction] = []
    @Published var dataLoaded: Bool = false
    
    func fetchData(word: String) {
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
             return
         }

         URLSession.shared.dataTask(with: url) { data, response, error in
             guard let data = data else { return }
             do {
                 let decodedData = try JSONDecoder().decode([Diction].self, from: data)
                 DispatchQueue.main.async {
                     self.diction = decodedData
                     self.dataLoaded = true
                     print(decodedData)
                 }
             } catch {
                 print(error)
             }
         }.resume()
    }
}
