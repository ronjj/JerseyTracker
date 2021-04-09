//
//  Player.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 4/8/21.
//

import Foundation

struct Player: Identifiable{
    var id =  UUID()
    var firstName : String
    var lastName : String
    var homeJersey : Bool
    var awayJersey : Bool
}

struct Players{
    static let samplePlayer1 = Player(firstName: "Ronald", lastName: "Jabouin", homeJersey: true, awayJersey: false)
    static let samplePlayer2 = Player(firstName: "Jack", lastName: "Smith", homeJersey: false, awayJersey: false)
    static let samplePlayer3 = Player(firstName: "Leo", lastName: "Messi", homeJersey: true, awayJersey: true)
    
    static let PlayersList = [samplePlayer1, samplePlayer2, samplePlayer3]
}
