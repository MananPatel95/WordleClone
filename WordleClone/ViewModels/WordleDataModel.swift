//
//  WordleDataModel.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-16.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    
    var gameOver = false
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        newGame()
    }
    
    // MARK: - Setup
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
    }
    
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        for char in letters {
            keyColors[String(char)] = .unused
        }
        
    }
    
    // MARK: - Game Play Current Word
    func addToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if currentWord == selectedWord {
            gameOver = true
            print("You Win")
            setCurrentGuessColors()
            inPlay = false
        }
        else {
            if verifyWord() {
                print("Valid")
                tryIndex += 1
                if tryIndex == 6 {
                    gameOver = true
                    inPlay = false
                    print("You Los")
                }
            } else {
                withAnimation {
                    self.incorrectAttempts[tryIndex] += 1
                }
                incorrectAttempts[tryIndex] = 0
            }
        }
    }
    
    func removeLetterFromCurrentWord() {
        if currentWord.count > 0 {
            currentWord.removeLast()
        }
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map {String($0)}
        var frequency = [String : Int]()
        for letter in correctLetters {
            frequency[letter, default: 0] += 1
        }
        
        for index in 0...4 {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessedLetters[index]
            
            if guessLetter == correctLetter {
                guesses[tryIndex].bgColors[index] = .correct
                frequency[guessLetter]! -= 1
            }
            
            if let freq = frequency[guessLetter], freq > 0,
                correctLetter.contains(guessLetter)
                && guesses[tryIndex].bgColors[index] != .correct {
                guesses[tryIndex].bgColors[index] = .misplaced
                frequency[guessLetter]! -= 1
            }
        }
    }
}
