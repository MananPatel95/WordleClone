//
//  SettingsView.swift
//  WordleClone
//
//  Created by Manan Patel on 2022-02-26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var csManager: ColorSchemeManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Change Theme")
                Picker("Display Mode", selection: $csManager.colorScheme) {
                    Text("Dark").tag(ColorScheme.dark)
                    Text("Light").tag(ColorScheme.light)
                    Text("System").tag(ColorScheme.unspecified)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
