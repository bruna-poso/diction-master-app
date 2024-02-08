import Foundation
import SwiftUI

struct DictionMainButtonView: View {
    @State private var tapSearchButton: Bool = false
    @State private var showSubscribeView: Bool = false
    @State private var isLoading: Bool = false
    
    @Binding var textField: String
    
    @ObservedObject private var viewModel = DictionViewModel()

    var body: some View {
        NavigationLink(
            destination: DefinitionView(viewModel: DefinitionViewModel(diction: viewModel.diction), 
                                        textField: textField),
            isActive: $tapSearchButton
        ) {
            Button(action: {
                self.isLoading = true
                self.actionButton()
            }) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Search")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                        .frame(width: 358.0, height: 64.0)
                        .background(Color(hex: 0x5BD6FD))
                        .cornerRadius(14.0)
                }
            }
        }
        .background(
            NavigationLink("", destination: SubscribeView(), isActive: $showSubscribeView).hidden()
        )
        .padding(.bottom, 20.0)
        .onDisappear {
            isLoading = false
        }
    }
    
    private func actionButton() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        if viewModel.shouldAllowSearch(word: textField.lowercased()) {
            viewModel.fetchData(word: textField.lowercased())

            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                tapSearchButton = true
            })

        } else {
            showSubscribeView = true
        }
    }
}
