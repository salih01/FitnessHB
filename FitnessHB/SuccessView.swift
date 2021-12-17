//
//  SuccessView.swift
//  FitBook (iOS)
//
//  Created by Salih Çakmak on 13.12.2021.
//

import SwiftUI

struct SuccessView: View {
    @State var show = false
    
    var body: some View {
        VStack {
            Text("Ok , I trying to connect!")
                .font(.system(size: 25, weight: .bold))
                .opacity(show ? 1 : 0)
                .animation(Animation.linear(duration: 1).delay(0.2))
            
            LottieView(filename: "success")
                .frame(width: 300, height: 300)
                .opacity(show ? 1 : 0)
                .animation(Animation.linear(duration: 1).delay(0.4))

            
        }
        .padding(.top,30)
        .background(BlurView(style: .systemMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(show ? 0.5 : 0))
        .scaleEffect(show ? 1 : 0.5)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onAppear{
            self.show = true
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
