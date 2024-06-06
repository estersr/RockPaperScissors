//
//  Hand.swift
//  RockPaperScissors
//
//  Created by Esther Ramos on 06/06/24.
//

import SwiftUI

enum Hand: CaseIterable {
    case rock, paper, scissors
    
    var image: Image {
        switch self {
        case .rock:
            Image("Rock")
        case .scissors:
            Image("Scissors")
        case .paper:
            Image("Paper")
        }
    }
}
