//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI


struct ContentView: View {


  @State private var searchText = ""
    
    var players = [
        Players(name: "ronald"),
        Players(name: "tom"),
        Players(name: "luke"),
        Players(name: "jack")

    
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                //hacky way of making a navigationTitle. Need to look into why it is not working
                Text("Jersey Tracker")
                    .font(.headline)
                    .padding()
                
                SearchBar(text: $searchText)
                
                List(players.filter({ "\($0)".contains(searchText.lowercased()) || searchText.isEmpty })){ players in
                    NavigationLink(destination: DetailedView(),
                    label: {
                        Text(players.name.capitalized)
                    })
                }
                
            }
            
        }
       // For some reason, this isn't working .navigationTitle("Jersey Tracker")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }


struct Players: Identifiable {
    var id = UUID()
    var name: String

}

