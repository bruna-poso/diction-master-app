import SwiftUI

@main
struct DictionMasterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DictionMainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
