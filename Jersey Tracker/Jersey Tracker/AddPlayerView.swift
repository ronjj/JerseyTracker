//
//  AddPlayerView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/30/21.
//

import SwiftUI

/*
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

*/

struct AddPlayerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var homeJersey = false
    @State private var awayJersey = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                    Form{
                        TextField("Players First Name", text: $firstName)
                        TextField("Players Last Name", text: $lastName)
                        Toggle("Home Jersey Received", isOn: $homeJersey)
                        Toggle("Away Jersey Received", isOn: $awayJersey)
                        
                        }
                    }
                }
            .navigationTitle("Add Player")
           // .navigationBarItems(trailing:
              //  Button("Save") {
                //    let item = Player(firstName: $firstName, lastName: $lastName, homeJersey: $homeJersey, awayJersey: $awayJersey)
                //    self.players.items.append(item)
                //    self.presentationMode.wrappedValue.dismiss()
                    
           // })
        }
    }


struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
   
}

//Add Player Function in case I nee it
/* func addNewPlayer() {
 @State var newPlayer : String = ""
 
    self.items.append((players.items.count + 1), name: newPlayer)
    self.newPlayer = ""
} */
