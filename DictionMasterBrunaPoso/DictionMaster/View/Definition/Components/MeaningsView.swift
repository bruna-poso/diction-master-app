import SwiftUI

struct MeaningsView: View {
    var index: Int
    var partOfSpeech: String
    var definition: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("\(index)) ")
                    .font(Font.custom("SFRounded-Ultralight", size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                +
                Text("[\(partOfSpeech)] ")
                    .font(Font.custom("SFRounded-Ultralight", size: 16))
                    .foregroundColor(Color(hex: 0x052D3980, alpha: 0.4))
                +
                Text(definition)
                    .font(Font.custom("SFRounded-Ultralight", size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
            }
            .padding([.horizontal, .top], 20.0)
            .padding(.bottom, 5.0)
        }
    }
}

#Preview {
    var index = 1
    var partOfSpeech = "noun"
    var definition = "a process of teaching, training and learning, especially in schools, colleges or universities, to improve knowledge and develop skills"

    return NavigationView {
        MeaningsView(index: index, 
                     partOfSpeech: partOfSpeech,
                     definition: definition)
    }
}
