//
//  PhotoModel.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

struct PhotoModel: Decodable {
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let alt_description: String
    let created_at: String
    let urls: [URLKing.RawValue:String]
    
    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
