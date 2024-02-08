import SwiftUI

struct LanguageHeaderView: View {
    var body: some View {
        HStack {
            Image(.enIcon)
            Text("English")
                .foregroundColor(Color(hex: 0x052D39))
                .multilineTextAlignment(.leading)
                .textCase(.uppercase)
                .font(Font.custom("SFRounded-Regular", size: 18))
        }
        .padding()
        .frame(height: 40.0)
        .background(Color(hex: 0x91A9B1, alpha: 0.1))
        .cornerRadius(20.0)
    }
}

#Preview {
    LanguageHeaderView()
}
