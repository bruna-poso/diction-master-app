import SwiftUI

struct MeaningsView: View {
    var index: Int
    var partOfSpeech: String
    var definition: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("\(index)) ")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
                +
                Text("[\(partOfSpeech)] ")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(hex: 0x052D3980, alpha: 0.4))
                    .fontWeight(.bold)
                +
                Text(definition)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
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
