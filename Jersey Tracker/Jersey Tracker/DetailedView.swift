//
//  DetailedView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/30/21.
//

import SwiftUI
import Combine
import Foundation



struct DetailedView: View {
    
    @State var homeJersey = false
    @State var awayJersey = false
    @State var notes = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                    Form{
                       Section (header: Text("Home Jersey")){
                            Toggle("Received", isOn: $homeJersey)
                            
                        }
                       
                       Section (header: Text("Away Jersey")){
                            Toggle("Received", isOn: $awayJersey)
                           
                        }
                        
                       Section (header: Text("Additional Notes")){
                        TextField("Notes", text: $notes)
                            .frame(height: 55)
                                      
                                          
                        }
                    }
                
             
                }
            .navigationTitle("Player Information")
            }
        }
    }

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}


