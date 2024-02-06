import SwiftUI

struct DefinitionFooterView: View {
    @Environment(\.dismiss) var dismiss
    
    var word: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("That’s it for “\(word)”!")
                .font(.system(size: 24))
                .fontWeight(.bold)
            Text("Try another search now!")
                .font(.system(size: 16))
                .fontWeight(.regular)
            
            Button(action: {
                dismiss()
            }) {
                Text("New Search")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .textCase(.uppercase)
                    .frame(width: 358.0, height: 64.0)
                    .background(Color(hex: 0x5BD6FD))
                    .cornerRadius(14.0)
            }
        }.padding()
    }
}

#Preview {
    var word = "Education"
    return NavigationView {
        DefinitionFooterView(word: word)
    }
}

