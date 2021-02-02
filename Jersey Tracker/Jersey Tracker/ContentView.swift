//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI
import Combine



struct ContentView: View {

@State private var showingAddScreen = false
@State var newPlayer : String = ""
@ObservedObject var playerStore = PlayerStore()
    
    var newPlayerField: some View {
        HStack{
            TextField("Enter A New Player", text: self.$newPlayer)
            Button(action: self.addNewPlayer , label: {
                Text("Add New")
            })
        }
    }
    
    func addNewPlayer() {
        playerStore.players.append(Player(id: String(playerStore.players.count + 1), name:newPlayer))
        self.newPlayer = ""
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                newPlayerField.padding()
                  
                List{
                    Section  (header: Text("All Players")) {
                        ForEach(self.playerStore.players) { player in
                            NavigationLink(destination: DetailedView()){
                                Text(player.name.capitalized)
                            }
                        }
                        .onDelete(perform:self.delete)
                        .onMove(perform: self.move)
                    }
                        

                    Section  (header: Text("Incomplete Players")) {
                        // A ForEach for players that 0 or 1 toggles set
                    }
                    
                    Section  (header: Text("Complete Players")) {
                        // A ForEach for players that have 2 toggles set
                    }
                    
           
                }
                
            }
            
           
            .navigationTitle("Jersey Tracker")
            
            //logic for plus and edit button needs to be redone
            .navigationBarItems(leading:EditButton())
           
        }
    }
    
    func delete(at offsets: IndexSet) {
        playerStore.players.remove(atOffsets: offsets)
    }
    
    func move (from source : IndexSet, to destination: Int) {
        playerStore.players.move(fromOffsets: source, toOffset: destination)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }



// Code I got from a tutorial to make the searchbar
   /*ForEach(players.filter({ "\($0)".contains(searchText.lowercased()) || searchText.isEmpty })){ players in
        NavigationLink(destination: DetailedView(),
                                       
            label: {
                Text(players.name.capitalized)
                    })
     }   */
