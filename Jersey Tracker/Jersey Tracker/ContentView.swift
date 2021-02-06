//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI
import Combine



struct PlayerItem: Identifiable, Codable {
    var id = UUID()
    var name: String

}


class Players: ObservableObject {
    @Published var items = [PlayerItem](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items")
        {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([PlayerItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }

    }


/* Old Class
class PlayerStore: ObservableObject {
    @Published var players = [Player]()
}
*/



struct ContentView: View {
    
@State private var showingAddPlayer = false
@ObservedObject var players = Players()
@ObservedObject var userSettings = UserSettings()
    
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section  (header: Text("All Players")) {
                        ForEach(self.players.items) { player in
                            NavigationLink(destination: DetailedView()){
                                Text(player.name.capitalized)
                            }
                        }
                        .onDelete(perform: self.delete)
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
            .navigationBarItems(leading:EditButton(),
            trailing:
                    Button(action: {
                        self.showingAddPlayer = true
                        
                            }) {
                                Image(systemName: "plus")
                            })
            //Show AddPlayerView as a Sheet
            .sheet(isPresented: $showingAddPlayer) {
                  AddPlayerView(players: self.players)
            }
            
        }
    }
    
    
    //Delete Player Function
    func delete(at offsets: IndexSet) {
        players.items.remove(atOffsets: offsets)
    }
    
    //Move Player Function
    func move (from source : IndexSet, to destination: Int) {
        players.items.move(fromOffsets: source, toOffset: destination)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }


