import SwiftUI
import CoreData

struct DictionMainView: View {
    @State private var textField: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                LanguageHeaderView().padding(.top, 30.0)
                Spacer()
                
                TextField("Type a Word...",
                          text: $textField,
                          prompt:
                            Text("Type a Word...")
                    .foregroundColor(Color(hex: 0x052D39, alpha: 0.5))
                    .font(Font.custom("SFRounded-Regular", size: 32)))
                
                .frame(width: 220.0)
                .font(Font.custom("SFRounded-Ultralight", size: 32))
                .foregroundColor(Color(hex: 0x052D39))
                .multilineTextAlignment(.center)
                
                Spacer()
                
                if !textField.isEmpty {
                    DictionMainButtonView(textField: $textField)
                }
            }
        }
    }
}

#Preview {
    DictionMainView()
}
