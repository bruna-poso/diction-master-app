import SwiftUI

struct DefinitionFooterView: View {
    @Environment(\.dismiss) var dismiss
    
    var word: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text("That’s it for “\(word)”!")
                .font(Font.custom("SFRounded-Ultralight", size: 24))
            Text("Try another search now!")
                .font(Font.custom("SFRounded-Regular", size: 16))
                .padding(.bottom, 20.0)

            Button(action: {
                dismiss()
            }) {
                Text("New Search")
                    .font(Font.custom("SFRounded-Ultralight", size: 18))
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

