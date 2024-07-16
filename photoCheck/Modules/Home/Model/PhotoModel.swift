//
//  PhotoModel.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import Foundation

struct unsplashResponse: Codable {
    let dataPhotos: [PhotoModel]
}

struct PhotoModel: Codable {
    let id, slug: String
    let createdAt: Date
    let description: String?
    let altDescription: String
    let links: WelcomeLinks
    let urls: Urls
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case description
        case altDescription = "alt_description"
        case links
        case urls
        case user
    }
}

struct WelcomeLinks: Codable {
    let download: String

    enum CodingKeys: String, CodingKey {
        case download
    }
}


// MARK: - Urls
struct Urls: Codable {
    let full, regular: URL
    
    enum CodingKeys: String, CodingKey {
        case full, regular
    }
}

// MARK: - User
struct User: Codable {
    let id: String
    let username: String
    let profileImage: ProfileImage
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case profileImage = "profile_image"
    }
}


// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium: String
}

