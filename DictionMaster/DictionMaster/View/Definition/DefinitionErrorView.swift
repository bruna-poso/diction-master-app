import SwiftUI

struct DefinitionErrorView: View {
    @Environment(\.dismiss) var dismiss

    var textField: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15.0) {
            Spacer()

            Text("Oops! It seems that an error occurred with the word ")
                .font(Font.custom("SFRounded-Ultralight", size: 24))
            +
            Text("“\(textField)”")
                .font(Font.custom("SFRounded-Ultralight", size: 24))
                .foregroundColor(Color(hex: 0x052D39, alpha: 0.4))

            Text("Please double-check your input and ensure that you have spelled the word correctly. If the issue persists, please try again later. Thank you!")
                .font(Font.custom("SFRounded-Regular", size: 16))
                .fontWeight(.regular)
            
            Spacer()

            Button(action: {
                dismiss()
            }) {
                Text("Try Again")
                    .font(Font.custom("SFRounded-Ultralight", size: 18))
                    .foregroundColor(.white)
                    .textCase(.uppercase)
            }
            .frame(width: 358.0, height: 64.0)
            .background(Color(hex: 0x5BD6FD))
            .cornerRadius(14.0)
        }
        .padding()
    }
}

#Preview {
    var word = "error"
    return NavigationView {
        DefinitionErrorView(textField: word)
    }
}
