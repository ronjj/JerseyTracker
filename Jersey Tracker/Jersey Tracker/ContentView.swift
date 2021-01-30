//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI


struct ContentView: View {

@Environment(\.managedObjectContext) var moc
@State private var searchText = ""
@State private var showingAddScreen = false
    
    var players = [
        Players(name: "ronald"),
        Players(name: "tom"),
        Players(name: "luke"),
        Players(name: "jack")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List(players.filter({ "\($0)".contains(searchText.lowercased()) || searchText.isEmpty })){ players in
                    NavigationLink(destination: DetailedView(),
                    label: {
                        Text(players.name.capitalized)
                    })
                }
                
            }
            .navigationTitle("Jersey Tracker")
            
            .navigationBarItems(leading:EditButton(), trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                    Image(systemName: "plus")
                }
                
                )
            
                .sheet(isPresented: $showingAddScreen) {
                    AddPlayerView().environment(\.managedObjectContext, self.moc)
                }
        }
    
       
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

