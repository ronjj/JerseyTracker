//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI
import Combine

struct ContentView: View {

@State var searchText = ""
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
    
    //Add Player Function
    func addNewPlayer() {
        playerStore.players.append(Player(id: String(playerStore.players.count + 1), name:newPlayer))
        self.newPlayer = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                newPlayerField.padding()
                SearchBar(text: $searchText).padding()
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
                        // A ForEach for players that have 0 or 1 toggle(s) set
                        /*
                         Need to add onDelete and onMove
                         functions under the ForEach when
                         I add it
                         */
                    }
                    
                    Section  (header: Text("Complete Players")) {
                        // A ForEach for players that have 2 toggles set
                        /*
                         Need to add onDelete and onMove
                         functions under the ForEach when
                         I add it
                         */
                    }
                }
            }
            
           
            .navigationTitle("Jersey Tracker")
            
            //logic for plus and edit button needs to be redone
            .navigationBarItems(leading:EditButton())
           
        }
    }
    
    //Delete Player Function
    func delete(at offsets: IndexSet) {
        playerStore.players.remove(atOffsets: offsets)
    }
    
    //Move Player Function
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
     }
 
 would also need the view SearchBar()
 */
