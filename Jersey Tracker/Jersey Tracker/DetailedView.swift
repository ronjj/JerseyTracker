//
//  DetailedView.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/30/21.
//

import SwiftUI

struct DetailedView: View {
    
    @State var homeJersey = false
    @State var awayJersey = false
    @State var notes = ""
    
    var body: some View {
            VStack(alignment: .leading, spacing: 30){
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment:.leading){
                        Text("Home Jersey")
                            .font(.headline)
                            .padding(.top, 20)

                        Toggle("Received", isOn: $homeJersey)
                        Divider()
                    }
                   
                    VStack(alignment:.leading){
                        Text("Away Jersey")
                            .font(.headline)
                            .padding(.top, 20)
                        Toggle("Received", isOn: $awayJersey)
                        Divider()
                    }
                    
                    VStack(alignment:.leading){
                        Text("Addtional Player Notes")
                            .font(.headline)
                            .padding(.top, 20)
                        TextField("Notes", text: $notes )
                            .padding(.top, 20)
                       
                    }
                   
                    Spacer()
                }
            }
        }
    }

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}
