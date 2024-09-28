//
//  ContentView.swift
//  SwiftGenCustomTemplate
//
//  Created by Serhan Khan on 26/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            //Using LocalizedStringKeys enum type to retrieve
            Text(LocalizationManager.shared.localizedString(for: .welcome_message))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
