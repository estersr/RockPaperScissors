//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Esther Ramos on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    //RandomElement() needs the ! to unwrapp the enum we created. (since we know its not empty, its fine to use the !)
    @State private var appChoice = Hand.allCases.randomElement()!
    @State private var playerScore = 0
    @State private var gameResult = ""
    
    var body: some View {
        VStack {
            Text("Oponent chose: ")
                .font(.largeTitle)
            
            HandImage(hand: appChoice)
            
            Text("Your score: \(playerScore)")
                .font(.headline)
            
            Text(gameResult)
                .font(.title)
                .foregroundColor(.blue)
            
            HStack {
                ForEach(Hand.allCases, id: \.self) { hand in
                    Button{
                        playerTapped(userChoice: hand)
                    } label: {
                        HandImage(hand: hand)
                    }
                }
            }
        }
    }
    
    func playerTapped(userChoice: Hand) {
        switch appChoice {
        case .rock:
            switch userChoice {
            case .rock:
                break
            case .paper:
                playerScore += 1
            case .scissors:
                playerScore -= 1
            }
        case .paper:
            switch userChoice {
            case .rock:
                playerScore -= 1
            case .paper:
                break
            case .scissors:
                playerScore += 1
            }
        case .scissors:
            switch userChoice {
            case .rock:
                playerScore += 1
            case .paper:
                playerScore -= 1
            case .scissors:
                break
            }
        }
    }
}

#Preview {
    ContentView()
}

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
