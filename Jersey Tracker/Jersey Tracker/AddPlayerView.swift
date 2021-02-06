//
//  AddPlayerView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/30/21.
//

import SwiftUI


class UserSettings: ObservableObject{
    
    
    @Published var homeJersey: Bool{
        didSet {
            UserDefaults.standard.set(homeJersey, forKey: "homeJersey")
        }
    }
    @Published var awayJersey: Bool{
        didSet {
            UserDefaults.standard.set(awayJersey, forKey: "awayJersey")
        }
    }
    @Published var notes: String{
        didSet {
            UserDefaults.standard.set(notes, forKey: "notes")
        }
    }
    
    
    
    init() {
        self.homeJersey = UserDefaults.standard.object(forKey: "homeJersey") as? Bool ?? false
        self.awayJersey = UserDefaults.standard.object(forKey: "awayJersey") as? Bool ?? false
       self.notes = UserDefaults.standard.object(forKey: "notes") as? String ?? ""
        }
    }



struct AddPlayerView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var newPlayer : String = ""
    @ObservedObject var players: Players
    @ObservedObject var userSettings = UserSettings()
    
    
    
    var newPlayerField: some View {
        HStack{
            TextField("Enter Player Name", text: self.$newPlayer)
        }
    }
    

    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                   
                
                    Form{
                        Section(header: Text("Player Name")){
                        newPlayerField
                        }
                    
                        
                       Section (header: Text("Home Jersey")){
                        Toggle("Received", isOn: $userSettings.homeJersey)
                            
                        }
                       
                       Section (header: Text("Away Jersey")){
                        Toggle("Received", isOn: $userSettings.awayJersey)
                           
                        }
                        
                       Section (header: Text("Additional Notes")){
                        TextEditor(text: self.$userSettings.notes)
                            .font(.custom("SF Pro", size: 18))
                            .frame(height: 125, alignment: .center)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        }
                    }
                }
            .navigationTitle("Add Player")
            .navigationBarItems(trailing:
                Button("Save") {    
                    let item = PlayerItem(name: self.newPlayer)
                    self.players.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                    
            })
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView(players: Players())
    }
   
}

//Add Player Function in case I nee it
/* func addNewPlayer() {
    self.items.append((players.items.count + 1), name: newPlayer)
    self.newPlayer = ""
} */
