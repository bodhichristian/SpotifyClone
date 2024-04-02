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
    let firstName: String
    let lastName: String
    let age: Int
    let email: String
    let phone: String
    let username: String
    let password: String
    let birthDate: String
    let image: String
    let height: Int
    let weight: Double
    
    static var mock: User {
        User(
            id: 444,
            firstName: "Ben",
            lastName: "Franklin",
            age: 300,
            email: "electricity@usa.gov",
            phone: "12DF4",
            username: "bennyfrank",
            password: "123",
            birthDate: "07/04/1776",
            image: Constants.randomImage,
            height: 70,
            weight: 170
        )
    }
}
