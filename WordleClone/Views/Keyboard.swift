//
//  Keyboard.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-16.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm: WordleDataModel
    var topRowArray = "QWERTYUIOP".map{String($0)}
    var middleRowArray = "ASDFGHJKL".map{String($0)}
    var thirdRowArray = "ZXCVBNM".map{String($0)}
    
    var body: some View {
        VStack(spacing: 2){
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .cornerRadius(4)
            }
            HStack(spacing: 2) {
                ForEach(middleRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .cornerRadius(4)
            }
            HStack(spacing: 2) {
                // Enter Button
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20, weight: .light, design: .default))
                .frame(width: 60, height: 50)
                .foregroundColor(Color.primary)
                .background(Color.unused)
                .cornerRadius(4)
                
                // Letters
                ForEach(thirdRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .cornerRadius(4)
                
                // Delete Button
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .frame(width: 40, height: 50)
                        .font(.system(size: 20, weight: .heavy, design: .default))
                        .foregroundColor(Color.primary)
                        .background(Color.unused)
                }
                .cornerRadius(4)
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(WordleDataModel())
            .scaleEffect(Global.keyboardScale)
    }
}
