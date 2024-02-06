import SwiftUI

@main
struct DictionMasterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            let viewModel = DictionViewModel()
//            DictionMainView(viewModel: viewModel)
            DictionMainView()
//            SubscribeView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
