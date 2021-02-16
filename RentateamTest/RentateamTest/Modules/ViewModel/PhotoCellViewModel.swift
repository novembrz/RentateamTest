//
//  PhotoCellViewModel.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

protocol PhotoCellViewModelType: class {
    var description: String { get }
    var imageUrl: String { get }
}

class PhotoCellViewModel: PhotoCellViewModelType {
    
    private var photo: UnsplashPhoto
    
    var imageUrl: String {
        return photo.urls["regular"] ?? ""
    }
    
    var description: String {
        return photo.alt_description ?? ""
    }
    
    init (photo: UnsplashPhoto) {
        self.photo = photo
    }
}
