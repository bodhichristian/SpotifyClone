//
//  DataBaseHelper.swift
//  SpotifyClone
//
//  Created by christian on 3/27/24.
//

import Foundation

struct DataBaseHelper {
    
    func getProducts() async throws -> [Product ]{
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
    
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
        return response.products
    }
    
    func getUsers() async throws -> [User]{
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
    
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(UserResponse.self, from: data)
        return response.users
    }
}






