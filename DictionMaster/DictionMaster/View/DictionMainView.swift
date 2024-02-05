import SwiftUI
import CoreData

struct DictionMainView: View {
    
    @State private var tapSearchButton: Bool = false
    @State private var textField: String = ""

    var body: some View {

        VStack {
            HStack {
                Image(.enIcon)
                Text("English")
                    .foregroundColor(Color(hex: 0x052D39))
                    .multilineTextAlignment(.leading)
                    .textCase(.uppercase)
                    .font(.custom("SF Pro Rounded", size: 18))
            }
            .padding(.all, 12.0)
            .frame(height: 40.0)
            .background(Color(hex: 0x91A9B1, alpha: 0.1))
            .cornerRadius(20.0)

            Spacer()

            TextField("Type a Word...",
                      text: $textField,
                      prompt:
                        Text("Type a Word...")
                .foregroundColor(Color(hex: 0x052D39, alpha: 0.5))
                .font(.custom("SF Pro Rounded", size: 28)))
            
            .frame(width: 220.0)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(hex: 0x052D39))
            .multilineTextAlignment(.center)
            
            Spacer()
            
            if !textField.isEmpty {
                Button(action: {
                    self.tapSearchButton.toggle()
                }) {
                    Text("Search")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                }
                .frame(width: 358.0, height: 64.0)
                .background(Color(hex: 0x5BD6FD))
                .cornerRadius(14.0)
            }
        }
        .padding(.vertical, 20.0)
    }
}

#Preview {
    DictionMainView()
}


//struct DictionMainView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//#Preview {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
