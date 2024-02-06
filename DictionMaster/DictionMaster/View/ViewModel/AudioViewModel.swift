import Foundation
import AVFoundation

class AudioViewModel: ObservableObject {
    @Published var phonetics: [DictionPhonetics] = []
    
    private var audioPlayer: AVAudioPlayer?
    
    init(phonetics: [DictionPhonetics]) {
        self.phonetics = phonetics
    }

    func firstPhoneticsInfo() -> (audioURL: String, text: String)? {
        if let firstPhonetics = phonetics.first(where: { ($0.text ?? "").isEmpty == false && !$0.audio.isEmpty }) {
            return (audioURL: firstPhonetics.audio, text: firstPhonetics.text ?? "")
        }
        return nil
    }
    
    func playAudio() {
        let url = firstPhoneticsInfo()?.audioURL
        guard let audioURL = URL(string: url ?? "") else {
            return
        }
        
        URLSession.shared.dataTask(with: audioURL) { data, response, error in
            guard let data = data, error == nil else {
                print("Error loading audio data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.main.async {
                do {
                    self.audioPlayer = try AVAudioPlayer(data: data)
                    self.audioPlayer?.prepareToPlay()
                    self.audioPlayer?.play()
                } catch let error {
                    print("Error creating AVAudioPlayer: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}
