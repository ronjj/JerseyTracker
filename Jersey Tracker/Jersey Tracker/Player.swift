//
//  Players.swift
//  Jersey Tracker
//
//  Created by Ronald Jabouin on 1/30/21.
//

import Foundation
import SwiftUI
import Combine

struct Player: Identifiable {
    var id = String()
    var name: String

}

class PlayerStore: ObservableObject {
    @Published var players = [Player]()
}
