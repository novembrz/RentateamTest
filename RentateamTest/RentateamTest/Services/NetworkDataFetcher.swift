//
//  NetworkDataFetcher.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

class NetworkDataFetcher{
    
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (PhotoModel?) -> ()) {
        networkService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: PhotoModel.self, from: data)
            completion(decode)
        }
    }
    
    //декодируем json-дату по абстрактной моделе
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
