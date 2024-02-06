import SwiftUI
import AVFoundation

struct AudioView: View {
    @ObservedObject var viewModel: AudioViewModel

    var body: some View {
        
        if let phoneticsInfo = viewModel.firstPhoneticsInfo() {
            HStack {
                Button(action: {
                    viewModel.playAudio()
                }) {
                    Image(.audioSpeakerOn)
                    
                }
                .frame(width: 46, height: 46)
                .background(Color(hex: 0x5BD6FD))
                .clipShape(Circle())
                
                Text(phoneticsInfo.text)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: 0x052D39, alpha: 0.4))
                    .padding(.leading, 5.0)
            }
            .padding()
            .onDisappear {
                viewModel.stopAudio()
            }
        }
    }
}

#Preview {
    let phonetics = [DictionPhonetics(text: "/ˌedʒuˈkeɪʃn/", audio: "https://api.dictionaryapi.dev/media/pronunciations/en/get-us.mp3")]
    return NavigationView {
        AudioView(viewModel: AudioViewModel(phonetics: phonetics))
    }
}
