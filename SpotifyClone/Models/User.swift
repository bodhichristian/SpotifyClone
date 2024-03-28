//
//  User.swift
//  SpotifyClone
//
//  Created by christian on 3/27/24.
//

import Foundation

struct UserResponse: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let height: Int
    let weight: Double
}
