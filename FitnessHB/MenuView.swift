////
//  MenuView.swift
//  FitBook
//
//  Created by Salih Çakmak on 24.11.2021.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 30) {
                            
                menuRow(title: "Account", icon: "gear")
                menuRow(title: "Sign Out", icon: "person.crop.circle")
                
           }
            .frame(maxWidth :.infinity)
            .frame( height: 300)
            .background(Color.white)

            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal,30)
            .overlay(
                Image("fit5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .offset(y: -150)
                    .shadow(radius: 15)
            )
        }
        .padding(.bottom,30)
        
   }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct menuRow: View {
    var title : String
    var icon : String
    
    var body: some View {
   
        HStack {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light, design: .default))
                .opacity(0.5)
                .frame(width: 32, height: 32)
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
