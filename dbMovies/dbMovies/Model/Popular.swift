//
//  model.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import UIKit

struct Movie: Codable {
    let title, image, overview: String?
    
    
}

enum CodingKeys: String, CodingKey {
    case image = "backdrop_path"
}

struct MovieData: Codable {
    let movies: [Movie]?
}
