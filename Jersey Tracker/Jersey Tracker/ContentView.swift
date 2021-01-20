//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI

struct Player {
    var id = UUID()
    var name: String
}

struct ContentView: View {
    let players = [Player(name:"Tom"), Player(name:"Luke"),Player(name:"Ron"),]
    
    
  
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(players, id: \.id) { player in
                        Text("\(player.name)")
                        
                }
            }
            
            .navigationBarTitle("Jersey Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
