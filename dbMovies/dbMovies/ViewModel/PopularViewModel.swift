//
//  viewModel.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import Foundation

class PopularViewModel: Network {
    var popular: [Movie] = []
    var errorMessage: String = ""
    let cellIdentifier = "cell"
    
    func fetchPopularMovies(completion: @escaping (Bool) -> Void) {
        
        guard var url = URL(string: baseURL) else { return }
        url.appendPathComponent(popularity + keyAPI)
        
        
        getData(url: url) { (response: Result<MovieData, Error>) in
            switch response {
            case .success(let movieData):
                guard let popMovies = movieData.movies else { return }
                self.popular = popMovies
                completion(true)
            case .failure(let failure):
                self.errorMessage = failure.localizedDescription
                completion(false)
          }
        }
      }
    }
    

