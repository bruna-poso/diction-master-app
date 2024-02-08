import SwiftUI

struct DefinitionItemView: View {
    @ObservedObject var viewModel: DefinitionViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.displayItems, id: \.globalIndex) { item in
                    VStack(alignment: .leading) {
                        MeaningsView(index: item.globalIndex,
                                     partOfSpeech: item.partOfSpeech,
                                     definition: item.definition)
                        if let example = item.example {
                            ExampleView(example: example).padding(.bottom, 10.0)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let viewModel = DefinitionViewModel(diction: DictionMock.getMockDiction())
    return DefinitionItemView(viewModel: viewModel)
}
