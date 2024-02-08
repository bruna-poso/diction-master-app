import Foundation
import SwiftUI
import CoreData
import Alamofire

class DictionViewModel: ObservableObject {
    @Published var diction: [Diction] = []

    func fetchData(word: String) {
        if let cachedDiction = getCachedDiction(word: word) {
            self.diction = cachedDiction
            return
        }
        
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
            return
        }
        
        AF.request(url).responseDecodable(of: [Diction].self) { response in
            switch response.result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.diction = decodedData
                    self.saveSearchToCoreData(word: word)
                    self.cacheDiction(word: word, data: decodedData)
                    print(decodedData)
                }

            case .failure(let error):
                print(error)
            }
        }
    }

    func shouldAllowSearch(word: String) -> Bool {
         if let cachedDiction = getCachedDiction(word: word) {
             self.diction = cachedDiction
             return true
         } else if isSearchLimitExceeded() {
             return false
         }

         return true
    }
    
    private func isSearchLimitExceeded() -> Bool {
        let fetchRequest: NSFetchRequest<History> = History.fetchRequest()
        let startOfDay = Calendar.current.startOfDay(for: Date()) as NSDate
        
        fetchRequest.predicate = NSPredicate(format: "timestamp >= %@", startOfDay)
        
        do {
            let searchCount = try PersistenceController.shared.container.viewContext.count(for: fetchRequest)
            return searchCount > 5
        } catch {
            print("Erro ao contar buscas no CoreData: \(error.localizedDescription)")
            return false
        }
    }
    
    private func saveSearchToCoreData(word: String) {
        let history = History(context: PersistenceController.shared.container.viewContext)
        history.word = word
        history.timestamp = Date()

        PersistenceController.shared.saveContext()
    }
    
    private func getCachedDiction(word: String) -> [Diction]? {
        if let cachedData = UserDefaults.standard.data(forKey: word),
           let cachedDiction = try? JSONDecoder().decode([Diction].self, from: cachedData) {
            return cachedDiction
        }
        return nil
    }

    private func cacheDiction(word: String, data: [Diction]) {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: word)
        }
    }
}
