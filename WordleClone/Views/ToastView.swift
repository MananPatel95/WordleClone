//
//  ToastView.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-26.
//

import SwiftUI

struct ToastView: View {
    let toastText: String
    
    var body: some View {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primary))
            .font(.system(size: 16, weight: .semibold, design: .default))
        
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(toastText: "Not in word list.")
    }
}
