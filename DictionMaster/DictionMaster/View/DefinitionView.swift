import SwiftUI

struct DefinitionView: View {
    @ObservedObject var viewModel: DefinitionViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.getWord())
                .font(.system(size: 45))
                .fontWeight(.bold)
                .padding()
                .frame(height: 50)
                .safeAreaPadding(.top, 20.0)
            
            AudioView(viewModel: AudioViewModel(phonetics: viewModel.getPhonetic())).frame(height: 60)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.displayItems, id: \.globalIndex) { item in
                        VStack(alignment: .leading) {
                            MeaningsView(index: item.globalIndex,
                                         partOfSpeech: item.partOfSpeech,
                                         definition: item.definition)
                            if let example = item.example {
                                ExampleView(example: example).padding(.bottom, 20.0)
                            }
                        }
                    }
                }
            }
            
            Spacer()
            Divider()
            DefinitionFooterView(word: viewModel.getWord())
        }
    }
}

#Preview {
    let viewModel = DefinitionViewModel(diction: [])
    return DefinitionView(viewModel: viewModel)
}
