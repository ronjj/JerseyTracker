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
    @ObservedObject var userSettings = UserSettings()
    @State var player = PlayerItem(name: "")
   
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading){
                    Form{
                       Section (header: Text("Home Jersey")){
                        Toggle("Received", isOn: self.$userSettings.homeJersey )
                            
                        }
                       
                       Section (header: Text("Away Jersey")){
                        Toggle("Received", isOn: self.$userSettings.awayJersey)
                           
                        }
                        
                       Section (header: Text("Additional Notes")){
                        TextEditor(text: self.$userSettings.notes)
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
        DetailedView()
    }
}


