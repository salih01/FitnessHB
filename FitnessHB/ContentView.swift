//
//  ContentView.swift
//  FitBook
//
//  Created by Salih Çakmak on 20.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var showCard = false
    @State var viewState = CGSize.zero
    @State var bottomState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            TittleView()
                .blur(radius: show ? 4 : 0)
                .animation(.easeInOut(duration: 0.5))
            BackCardView2()
                .offset(x: 0, y:show ? -330 : -50)
                .scaleEffect(0.90)
                .rotationEffect(Angle(degrees: show ? 0 : 10))
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10, y: 0, z: 0))
                .animation(.easeInOut(duration: 0.3))
            BackCardView1()
                .offset(x: 0, y: show ? -130 : -30)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 0 : 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10, y: 0, z: 0))
                .animation(.easeInOut(duration: 0.3))
            CardView()
                .onTapGesture {
                    self.show.toggle()
                }

            BottomCardView()
                .offset(x: 0, y: show ? 500 : 1000)
                .offset(y: bottomState.height)
                .animation(.easeInOut(duration: 0.5))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.showCard = false
                        }
                        if self.bottomState.height < -100
                        {
                            self.bottomState.height = -300
                        }
                        else {
                            self.bottomState = .zero

                        }
                            
                    }
                
                )


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}

struct CardView: View {
    var body: some View {
        
        Image("fit1")
            .resizable()
            .aspectRatio( contentMode: .fit)
            .cornerRadius(30)
            .shadow(radius: 40)
            .frame(width: 340, height: 220)
        VStack (alignment: .leading){
            Spacer()
            
            Text("What is FitBook ?")
                .foregroundColor(Color.white)
                .font(.title)
                .fontWeight(.semibold)
                .position(x: 170, y: 175)
            
        }
        .frame(width: 340, height: 220)
    }
}

struct BackCardView2: View {
    var body: some View {
        VStack {
            Image("fit3")
                .resizable()
                .frame(width: 320, height: 240)
                .aspectRatio(contentMode:.fit)
                .cornerRadius(20)
                .shadow(radius: 20)
        }
    }
}

struct BackCardView1: View {
    var body: some View {
        VStack {
            Image("fit4")
                .resizable()
                .frame(width: 330, height: 220)
                .aspectRatio(contentMode:.fit)
                .cornerRadius(20)
                .shadow(radius: 20)
            
        }
    }
}



struct TittleView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    Image("fit2")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(30)
                        .scaleEffect(1.02)
                    
                    Text("Who am I ?")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding()
                        .font(.largeTitle)
                    
                }.edgesIgnoringSafeArea(.all)
            }
            
            
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack (spacing: 20){
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(10)
                .opacity(0.1)
            Text("Buraya deneyimlerimi yazacağım")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(5)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.top, 25)
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 30)
        .opacity(0.9)
    }
}
