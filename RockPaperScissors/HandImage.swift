//
//  HandImage.swift
//  RockPaperScissors
//
//  Created by Esther Ramos on 06/06/24.
//

import SwiftUI

struct HandImage: View {
    var hand: Hand
    var body: some View {
        hand.image
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 120)
            .padding()
    }
}

#Preview {
    HandImage(hand: .paper)
}
