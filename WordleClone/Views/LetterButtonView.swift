//
//  LetterButtonView.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-16.
//

import SwiftUI

struct LetterButtonView: View {
    
    @EnvironmentObject var dm: WordleDataModel
    var letter: String
    
    var body: some View {
        Button {
            dm.addToCurrentWord(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50, alignment: .center)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonView(letter: "L")
            .environmentObject(WordleDataModel())
    }
}
