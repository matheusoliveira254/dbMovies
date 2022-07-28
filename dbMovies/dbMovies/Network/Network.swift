//
//  Networking.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import Foundation

class Network {
    
    var baseURL = "https://api.themoviedb.org/3/movie"
    var keyAPI = "bfb9225fcd93091f6a7e19e6e22a3b59"
    var pathURL = "now_playing"
    var queryURL = "api_key"

    
  //"https://api.themoviedb.org/3/movie/550?api_key=bfb9225fcd93091f6a7e19e6e22a3b59"
    
    func getData<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse else { return }
            let decoder = JSONDecoder()
            
            if let error = error {
                print("Request Failed: \(error), \(error.localizedDescription)")
                completion(.failure(error))
            }
            
            if response.statusCode == 200 {
                do {
                    let tempData = try decoder.decode(T.self, from: data)
                    completion(.success(tempData))
                } catch let error {
                    print("Failed Decoding Data: \(error), \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
        
    }
}
