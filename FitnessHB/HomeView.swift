//
//  HomeView.swift
//  FitBook
//
//  Created by Salih Çakmak on 27.11.2021.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile : Bool
    @State var showUpdate = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Workout")
                        .font(.system(size: 25,weight: .bold))
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    

                    Button(action: {self.showUpdate.toggle()}){
                        Image(systemName: "bolt")
                            .renderingMode(.original)
                            .font(.system(size: 24,weight: .bold))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .foregroundColor(.black).opacity(0.6)
                            .clipShape(Circle())
                        
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x:0, y: 1)
                            .shadow(color: Color.black.opacity(0.6), radius: 10, x:0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate){
                        ContentView()

                    }
        

                }
                .padding(.top,30)
                .padding(.leading,14)
                .padding(.horizontal)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 30) {
                        ForEach(SectionData) { item in
                            GeometryReader{ geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(
                                        degrees:
                                            Double(
                                                geometry.frame(in:.global).minX) / -20), axis:(x: 0,y: 10,z: 0))

                            }
                            .frame(width: 275, height: 275)
                        }
                        
                    }.padding(30)
                     .padding(.bottom,30)
                    
                }
                HStack{
                    Text("Day 1 - 30")
                        .font(.system(size: 24,weight: .bold))
                    Spacer()
                }
                .padding(.leading ,30)
                .offset(y:-40)
                
                SectionView(section: SectionData[1], width: screen.width-60, height: 300)
                    .offset(y:-35)
                    



                    


                Spacer()
                

            }
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section  : Section
    
    var width: CGFloat = 275
    var height: CGFloat = 275

    var body: some View {
        ZStack {
            section.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 275)
                .cornerRadius(30)
                .shadow(radius: 20)
            
            HStack {
                Text(section.title)
                    .font(.system(size: 25 , weight: .bold))
                    .frame(width: 160)
                    .foregroundColor(Color.white)
                    .padding()
            }
            .frame(width: 275 , height: 275,alignment: .bottomLeading)
            
            
        }
        .frame(width: width, height: height)
    }
}

struct Section: Identifiable {
    
    var id = UUID()
    var title : String
    var image : Image
}

let SectionData = [Section(title: "Full Body 1", image: Image("fit3")),
                   Section(title: "Full Body 2", image: Image("fit2")),
                   Section(title: "Full Body 3", image: Image("fit1"))]

