import SwiftUI

struct SubscribeView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            Image(.image)
                .frame(height: 380.0)
                .edgesIgnoringSafeArea(.top)
                .scaledToFill()
            Image(.icon)
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
                    .font(Font.system(size: 20))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
                +
                Text("unlimited ")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color(hex: 0x5BD6FD))
                    .fontWeight(.bold)
                +
                Text("searches and full access to ")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
                +
                Text("all features.")
                    .font(Font.system(size: 20))
                    .foregroundColor(Color(hex: 0x5BD6FD))
                    .fontWeight(.bold)
            }
            .padding(.top, 26.0)
            .padding(.horizontal, 46.0)
            .multilineTextAlignment(.center)
            
            VStack {
                Text("Try 7 Days Free, ")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
                +
                Text("then only ")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.regular)
                +
                Text("$19,99 ")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.bold)
                +
                Text("per year. \n Cancel anytime.")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(hex: 0x052D39))
                    .fontWeight(.regular)
            }
            .padding(.vertical, 20.0)
            .padding(.horizontal, 35.0)
            .multilineTextAlignment(.center)

            Button(action: {
                dismiss()
            }) {
                Text("Subscribe")
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
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
