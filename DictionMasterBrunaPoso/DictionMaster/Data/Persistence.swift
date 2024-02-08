import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DictionMaster")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
                print("Context saved successfully.")
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
}
