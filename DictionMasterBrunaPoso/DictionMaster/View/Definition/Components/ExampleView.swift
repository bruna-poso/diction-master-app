import SwiftUI

struct ExampleView: View {
    var example: String
    
    var body: some View {
        VStack {
            Text("• ")
                .font(Font.custom("SFRounded-Ultralight", size: 16))
                .foregroundColor(Color(hex: 0x052D39))
            +
            Text(example)
                .font(Font.custom("SFRounded-Regular", size: 16))
                .foregroundColor(Color(hex: 0x052D39))
                .fontWeight(.regular)
        }
        .padding(.leading, 20)
    }
}

#Preview {
    var example = "primary/elementary education"
    return NavigationView {
        ExampleView(example: example)
    }
}

