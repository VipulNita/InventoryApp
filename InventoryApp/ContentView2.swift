//
//  ContentView2.swift
//  InventoryApp
//
//  Created by vipul kumar on 25/07/24.
//

import SwiftUI


extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

struct ContentView2: View {
//    @Binding var textFromPage1: String
    @State var response: InventoryResponse? // nil
    
    @State var inventories: [Inventory]?
    @StateObject private var viewModel = ContentView2Model()
    @State var isHidden = false

    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            List {
                ForEach(inventories ?? []) { inventory in
                    Text("Name: \(inventory.name)")
                    AsyncImage(url: URL(string: inventory.url)) {image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 600, height: 300)
                    } placeholder: {
                        ProgressView()
                    }
                    Text("Quantity: \(inventory.quantity)")
                    
                
                }
            }
        }
        .padding()
        .task {
            do {
                response = try await viewModel.getResponseFromServer() // todo pass text3
                inventories = response?.inventories ?? []
                isHidden = true
            } catch InventoryError.URLError {
                print("Error found in the URL")
            } catch InventoryError.ResponseError {
                print("Server down")
            } catch {
                print("Something else", error)
            }
        }
    }
}

#Preview {
    ContentView2()
}
