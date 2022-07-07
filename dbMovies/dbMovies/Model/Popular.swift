//
//  model.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import UIKit

struct Movie {
    let title, image, overview: String?
    
    
}

enum CodingKeys: String, CodingKey {
    case image = "backdrop_path"
}

struct movieData {
    let movies: [Movie]
}
