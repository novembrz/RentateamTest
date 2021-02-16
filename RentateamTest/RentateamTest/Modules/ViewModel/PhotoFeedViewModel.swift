//
//  PhotoFeedViewModel.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

protocol PhotoFeedViewModelType {
    var photos: [UnsplashPhoto] { get set }
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath: IndexPath) -> PhotoCellViewModelType?
}

class PhotoFeedViewModel: PhotoFeedViewModelType {

    var photos: [UnsplashPhoto] = []
    
    func numberOfRows() -> Int {
        return photos.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PhotoCellViewModelType? {
        let photo = photos[indexPath.row]
        return PhotoCellViewModel(photo: photo)
    }
    
}
