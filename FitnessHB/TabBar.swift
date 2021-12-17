//
//  TabBar.swift
//  FitBook
//
//  Created by Salih Çakmak on 30.11.2021.
//

import SwiftUI

struct TabBar: View {
    var body: some View {

        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            
            ContentView().tabItem {
                Image(systemName: "bolt.circle.fill")
                Text("Who am I")
            }
            
        }
        .edgesIgnoringSafeArea(.top)

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
       
            TabBar()

    }
}
