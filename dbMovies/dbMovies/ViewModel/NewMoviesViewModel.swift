//
//  viewModel.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import Foundation

class NewMoviesViewModel: Network {
    var newMovies: [Movie] = []
    var errorMessage: String = ""
    let movieCategory = "New Movies"
    
    func fetchNewMovies(completion: @escaping (Bool) -> Void) {
        
        guard var url = URL(string: baseURL) else { return }
        url.appendPathComponent(pathURL)
        var urlComponent = URLComponents(string: url.absoluteString)
        let query = URLQueryItem(name: queryURL, value: keyAPI)
        urlComponent?.queryItems = [query]
        
        guard let finalURL = urlComponent?.url else { return }
        print(urlComponent!.url!.absoluteString)
        
        getData(url: finalURL) { (response: Result<MovieData, Error>) in
            switch response {
            case.success(let movieData):
                guard let popMovies = movieData.results else { return }
                self.newMovies = popMovies
                completion(true)
                case.failure(let failure):
                self.errorMessage = failure.localizedDescription
                completion(false)
          }
        }
      }
    }
