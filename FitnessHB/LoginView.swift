//
//  LoginView.swift
//  FitBook
//
//  Created by Salih Çakmak on 13.12.2021.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isFocuced = false
    @State var showAllert = false
    @State var allertMessage = "Something went Wrong"
    @State var isLoading = false
    @State var isSuccessful = false
    
    func Login() {
        
         self.hideKeyboard()
         self.isFocuced=false
         self.isLoading = true
         
         DispatchQueue.main.asyncAfter(deadline: .now() + 2){
             self.isLoading = false
           //  self.showAllert = true
             self.isSuccessful = true
         }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
          //  self.showAllert = true
            self.isSuccessful = false
        }
    }
    
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            ZStack (alignment: .top){
                    
                Color.white.opacity(0.8 )
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                
                CoverView()
                
                VStack {
                    HStack {
                        
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color.orange)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        TextField("Your email adress", text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height:44)
                            .onTapGesture {
                                self.isFocuced = true
                            }
                    }
                    
                    Divider().padding(.leading,80)
                    
                    HStack {
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color.orange)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        SecureField("Your email adress", text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
                            //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                        .frame(height:44)
                    }
                }
                .frame(height :135)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.7), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y:460)
                
                
                
                
                HStack {
                    Text("Forgot Password ?")
                        .font(.subheadline)
                    
                    Spacer()
                    Button(action: {
                        self.Login()
                        
                    }){
                        Text("Login")
                            .foregroundColor(.white)
                    }
                    .padding(12)
                    .padding(.horizontal,30)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.orange.opacity(0.3), radius: 20, x: 0, y: 20)
                    .alert(isPresented: $showAllert){
                        Alert(title: Text("ERROR"), message: Text(self.allertMessage), dismissButton: .default(Text("ok")))
                    }
                    
                }
                .frame(maxWidth:.infinity, maxHeight:.infinity,alignment: .bottom)
                .padding()
                
            }
            .offset(y: isFocuced ? -300 :0)
            .animation(.easeInOut)
            .onTapGesture {
                self.isFocuced = false
                self.hideKeyboard()
            }
            
            if isLoading {
                LoadingView()
            }
            
            if isSuccessful {
                SuccessView()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    @State var viewState = CGSize.zero
    @State var isDraging = false
    
    var body: some View {
        VStack {
            GeometryReader {    geometry in
                Text("Login ,Start Moving ! ")
                    .foregroundColor(.white)
                    .font(.system(size: geometry.size.width/10, weight: .bold))
            }
            .frame( maxWidth: 300, maxHeight: 100)
            .padding(.horizontal,16)
            .multilineTextAlignment(.center)
            .offset(x: viewState.width/20, y: viewState.height/20)
            
            
        }
        .padding(.top,-175)
        .frame(height :477)
        .frame(maxWidth:.infinity)
        .background(
            Image("fit3")
                .resizable()
                .aspectRatio( contentMode: .fill)
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .scaleEffect(isDraging ? 0.9 : 1)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1,duration: 0.9))
        .rotation3DEffect(Angle(degrees: 10), axis: (x: viewState.width, y: viewState.height, z: 0))
        
        .gesture(
            DragGesture().onChanged {
                value in
                self.viewState = value.translation
                self.isDraging = true
            }
                .onEnded{ value in
                    self.viewState = .zero
                    self.isDraging = false
                    
                }
        )
    }
}
