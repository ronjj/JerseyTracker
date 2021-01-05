//
//  ContentView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/4/21.
//

import SwiftUI

struct ContentView: View {
  
    
    var body: some View {
        NavigationView{
            
            Form{
                Section (header: Text("All Players")){
                
                    
                }
                
                Section (header: Text("Incomplete PLayers")){
                    
                    
                }
                
                Section (header: Text("Complete Players")){
                    
                    
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
