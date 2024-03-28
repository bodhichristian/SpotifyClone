//
//  ContentView.swift
//  SpotifyClone
//
//  Created by christian on 3/27/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    ForEach(products) { product in
                        Text(product.title)
                    }
                }
                VStack(alignment: .leading) {
                    ForEach(users) { user in
                        Text(user.firstName)
                    }
                }
            }
            .foregroundStyle(.spotifyGreen)
        }
        .padding()
        .task {
            await getData()
        }
    }
    private func getData() async {
        do {
            products = try await DataBaseHelper().getProducts()
            users = try await DataBaseHelper().getUsers()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
