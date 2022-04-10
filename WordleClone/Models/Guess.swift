//
//  Guess.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-16.
//

import SwiftUI

struct Guess {
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .wrong, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessedLetters: [String] {
        word.map {
            String($0)
        }
    }
    
    var results: String {
        let tryColors: [Color : String] = [.misplaced : "🟨", .correct : "🟩", .wrong : "⬛"]
        return bgColors.compactMap {tryColors[$0]}.joined(separator: "")
    }
}
