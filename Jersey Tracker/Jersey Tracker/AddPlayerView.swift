//
//  AddPlayerView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/30/21.
//

import SwiftUI

struct AddPlayerView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var homeJersey = false
    @State var awayJersey = false
    @State var notes = ""
    @State var newPlayer : String = ""
    
    
    var newPlayerField: some View {
        HStack{
            TextField("Enter Player Name", text: self.$newPlayer)
        /*Button(action: self.addNewPlayer , label: {
                Text("Add New")
            })*/
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                   
                
                    Form{
                        Section(header: Text("Player Name")){
                        newPlayerField.padding()
                        }
                        
                       Section (header: Text("Home Jersey")){
                            Toggle("Received", isOn: $homeJersey)
                            
                        }
                       
                       Section (header: Text("Away Jersey")){
                            Toggle("Received", isOn: $awayJersey)
                           
                        }
                        
                       Section (header: Text("Additional Notes")){
                        TextEditor(text: $notes)
                            .font(.custom("SF Pro", size: 18))
                                      
                                          
                        }
                    }
                }
            .navigationTitle("Add Player")
            }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}

//Add Player Function in case I nee it
/* func addNewPlayer() {
    self.items.append((players.items.count + 1), name: newPlayer)
    self.newPlayer = ""
} */
