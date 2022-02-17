//
//  WordleDataModel.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-16.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    init() {
        newGame()
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
    }
    
    func newGame() {
        populateDefaults()
    }
}
