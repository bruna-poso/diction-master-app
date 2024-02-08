import SwiftUI

struct SubscribeView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image(.image)
                .frame(height: 380.0)
                .edgesIgnoringSafeArea(.top)
                .scaledToFill()
            Image(.dictionIcon)
                .padding(.top, -60.0)
                .frame(width: 78.0, height: 78.0)
            Image(.title)
                .padding(.leading, 22.0)
                .padding(.top, -40.0)
                .frame(width: 188.0, height: 32.0)
        }
        .frame(height: 450)
        
        ScrollView {
            VStack {
                Text("Subscribe now to get ")
                    .font(Font.custom("SFRounded-Ultralight", size: 20))
                    .foregroundColor(Color(hex: 0x052D39))
                +
                Text("unlimited ")
                    .font(Font.custom("SFRounded-Ultralight", size: 20))
                    .foregroundColor(Color(hex: 0x5BD6FD))
                +
                Text("searches and full access to ")
                    .font(Font.custom("SFRounded-Ultralight", size: 20))
                    .foregroundColor(Color(hex: 0x052D39))
                +
                Text("all features.")
                    .font(Font.custom("SFRounded-Ultralight", size: 20))
                    .foregroundColor(Color(hex: 0x5BD6FD))
            }
            .padding(.top, 26.0)
            .padding(.horizontal, 46.0)
            .multilineTextAlignment(.center)
            
            VStack {
                Text("Try 7 Days Free, ")
                    .font(Font.custom("SFRounded-Ultralight", size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
                +
                Text("then only ")
                    .font(Font.custom("SFRounded-Regular", size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                +
                Text("$19,99 ")
                    .font(Font.custom("SFRounded-Ultralight", size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
                +
                Text("per year. \n Cancel anytime.")
                    .font(Font.custom("SFRounded-Regular", size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
            }
            .padding(.vertical, 20.0)
            .padding(.horizontal, 35.0)
            .multilineTextAlignment(.center)

        }.navigationBarHidden(true)
        
        VStack {
            Button(action: {
                dismiss()
            }) {
                Text("Subscribe")
                    .font(Font.custom("SFRounded-Ultralight", size: 18))
                    .foregroundColor(.white)
                    .textCase(.uppercase)
            }
            .frame(width: 358.0, height: 64.0)
            .background(Color(hex: 0x5BD6FD))
            .cornerRadius(14.0)
            .padding(.horizontal, 18.0)
            .padding(.bottom, 16.0)
        }
    }
}

#Preview {
    SubscribeView()
}
