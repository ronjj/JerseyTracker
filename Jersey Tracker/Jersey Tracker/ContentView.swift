//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI



struct ContentView: View {
    
    @State private var showingAddPlayer = false
    @State private var playersList = Players.PlayersList
    let player: Player
    
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section (header: Text("All Players")) {
                        ForEach(playersList) { player in
                            Text(player.firstName)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                    
                }
                
                /*
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
                 */
            }
            .navigationTitle("Jersey Tracker")
            .navigationBarItems(leading:EditButton(),
                                trailing:
                                    Button(action: {
                                        self.showingAddPlayer = true
                                        
                                    }) {
                                        Image(systemName: "plus")
                                    })
            //Show AddPlayerView as a Sheet
            .sheet(isPresented: $showingAddPlayer) {
                AddPlayerView()
            }
        }
        
    }

    
    
    //Delete Player Function
    func delete(at offsets: IndexSet) {
        playersList.remove(atOffsets: offsets)
    }
    
    //Move Player Function
    func move (from source : IndexSet, to destination: Int) {
        playersList.move(fromOffsets: source, toOffset: destination)
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(player: Players.samplePlayer1)
        }
    }
}
