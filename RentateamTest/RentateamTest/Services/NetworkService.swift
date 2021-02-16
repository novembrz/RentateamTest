//
//  NetworkService.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import Foundation

class NetworkService {
    
    //запрос данных через URL API Unsplash
    func request(searchTerm: String, photosCount: Int?, completion: @escaping (Data?, Error?) -> Void)  {
        
        let parameters = self.prepareParaments(searchTerm: searchTerm, photosPage: photosCount)
        let url = self.createUrl(with: parameters)
        print("UNSPLASH url: \(url)")
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    //метод для использования Access Key
    private func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID hm3qCYGipN_0mp3OZf_kyICIa7pnbJ-2r42KID6vqQ0"
        return headers
    }
    
    //функция для создания параметров url-адреса. Ключи взяты из документации
    private func prepareParaments(searchTerm: String?, photosPage: Int?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(photosPage ?? 1)
        return parameters
    }
    
    //создаем url-адрес из составных частей
    private func createUrl(with params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)} // массив параметров переконвертированных для url строки
        return components.url!
    }
    
    //url session
    private func createDataTask(from request: URLRequest, completion: @escaping (Data? , Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
