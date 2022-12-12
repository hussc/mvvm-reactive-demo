//
//  ImageResponse.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

struct ImageResponse: Codable {
    let id: Int
    
    let pageURL: String
    let type: String
    let tags: String
    let previewURL: String
    let previewWidth: Int
    let previewHeight: Int
    
    
    let largeImageURL: String
    let fullHDURL: String
    let imageURL: String
    let imageWidth: Int
    let imageHeight: Int
    let imageSize: Int
    
    let views: Int
    let downloads: Int
    let likes: Int
    let comments: Int
    
    let userID: Int
    let user: String
    let userImageURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case pageURL
        case type
        case tags
        case previewURL
        case previewWidth
        case previewHeight
        case largeImageURL
        case fullHDURL
        case imageURL
        case imageWidth
        case imageHeight
        case imageSize
        case views
        case downloads
        case likes
        case comments
        case userID = "user_id"
        case user
        case userImageURL
    }
}
