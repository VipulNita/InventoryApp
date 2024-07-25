//
//  ContentView.swift
//  InventoryApp
//
//  Created by vipul kumar on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "hands.clap")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                NavigationLink(destination: Page2View()) {
                    Label("Checkout Inventory", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
