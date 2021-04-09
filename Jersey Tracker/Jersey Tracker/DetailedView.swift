//
//  DetailedView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/30/21.
//

import SwiftUI



struct DetailedView: View {
   // @ObservedObject var userSettings = UserSettings()
    @Binding var homeJersey: Bool
    @Binding var awayJersey: Bool
    @Binding var notes: String
   
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                    Form{
                       Section (header: Text("Home Jersey")){
                        Toggle("Received", isOn: self.$homeJersey )
                            
                        }
                       
                       Section (header: Text("Away Jersey")){
                        Toggle("Received", isOn: self.$awayJersey)
                           
                        }
                        
                       Section (header: Text("Additional Notes")){
                        TextEditor(text: self.$notes)
                            .font(.custom("SF Pro", size: 18))
                            .frame(height: 125, alignment: .center)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                                      
                        }
                    }
                }
            .navigationTitle("Player Information")
            
            }
        }
    }

struct DetailedView_Previews: PreviewProvider {
   
    static var previews: some View {
        DetailedView(homeJersey: .constant(false), awayJersey: .constant(false), notes: .constant("") )
    }
}


