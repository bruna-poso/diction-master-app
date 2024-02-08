import SwiftUI

@main
struct DictionMasterApp: App {
    @StateObject private var dictionViewModel = DictionViewModel()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DictionMainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dictionViewModel)
        }
    }
}
