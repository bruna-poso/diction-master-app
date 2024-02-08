import SwiftUI

struct DefinitionView: View {
    @ObservedObject var viewModel: DefinitionViewModel
    
    var textField: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.getWord())
                .font(Font.custom("SFRounded-Ultralight", size: 45))
                .padding()
                .frame(height: 50)
                .safeAreaPadding(.top, 20.0)
            
            AudioView(viewModel: AudioViewModel(phonetics: viewModel.getPhonetic())).frame(height: 60)
            
            if !viewModel.displayItems.isEmpty {
                DefinitionItemView(viewModel: viewModel)
                Spacer()
                Divider()
                DefinitionFooterView(word: viewModel.getWord())
            } else {
                DefinitionErrorView(textField: textField)
            }
        }.navigationBarHidden(true)
    }
}

#Preview {
    let viewModel = DefinitionViewModel(diction: DictionMock.getMockDiction())
    return DefinitionView(viewModel: viewModel, textField: "Error")
}
