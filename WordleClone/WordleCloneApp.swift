//
//  WordleCloneApp.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-16.
//

import SwiftUI

@main
struct WordleCloneApp: App {
    
    @StateObject var dm = WordleDataModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
