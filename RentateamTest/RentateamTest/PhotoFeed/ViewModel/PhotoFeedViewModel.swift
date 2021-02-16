//
//  PhotoFeedViewModel.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

protocol PhotoFeedViewModelType {
    var photos: [UnsplashPhoto] { get set }
    func searchPhoto(searchText: String, completion: @escaping() -> ())
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath: IndexPath) -> PhotoCellViewModelType?
}

class PhotoFeedViewModel: PhotoFeedViewModelType {
    
    var networkDataFetcher = NetworkDataFetcher()
    var photos: [UnsplashPhoto] = []
    var selectedPhoto: UnsplashPhoto!
    
    //MARK: - Network Logic
    
    func searchPhoto(searchText: String, completion: @escaping() -> ()){
        
        self.networkDataFetcher.fetchImages(searchTerm: searchText) { [weak self] (searchResults) in
            guard let fetchedPhotos = searchResults else { return }
            self?.photos = fetchedPhotos.results
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    //MARK: - Methods for configure CollectiomView
    
    func numberOfRows() -> Int {
        return photos.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PhotoCellViewModelType? {
        let photo = photos[indexPath.row]
        return PhotoCellViewModel(photo: photo)
    }
    
}
