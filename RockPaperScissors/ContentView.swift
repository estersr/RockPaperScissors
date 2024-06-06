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
    @State private var previousScore = 0
    var gameResult: String {
        if previousScore == playerScore {
            return "Drawn!"
        } else if previousScore > playerScore {
            return "You Lost!"
        } else {
            return "You Won!"
        }
    }
    @State private var userChoice: Hand? = nil
    
    
    var body: some View {
        VStack {
            if userChoice != nil {
                Text("Oponent chose: ")
                    .font(.largeTitle)
                
                HandImage(hand: appChoice)
            }
            // MARK: - Results
            // if let creates a new variable when the value isnt nil
            if let userChoice {
                Text(gameResult)
                    .font(.title)
                    .foregroundColor(.blue)
                Text("You chose: ")
                HandImage(hand: userChoice)
                Button("Try again"){
                    self.userChoice = nil
                    appChoice = Hand.allCases.randomElement()!
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            } else {
                // MARK: - User Options
                Text("Select your choice")
                
                HStack {
                    ForEach(Hand.allCases, id: \.self) { hand in
                        Button{
                            playerTapped(buttonChoice: hand)
                        } label: {
                            HandImage(hand: hand)
                        }
                    }
                }
            }
            
            Text("Your score: \(playerScore)")
                .font(.headline)
        }
    }
    
    func playerTapped(buttonChoice: Hand) {
        previousScore = playerScore
        self.userChoice = buttonChoice
        switch appChoice {
        case .rock:
            switch buttonChoice {
            case .rock:
                break
            case .paper:
                playerScore += 1
            case .scissors:
                playerScore -= 1
            }
        case .paper:
            switch buttonChoice {
            case .rock:
                playerScore -= 1
            case .paper:
                break
            case .scissors:
                playerScore += 1
            }
        case .scissors:
            switch buttonChoice {
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

