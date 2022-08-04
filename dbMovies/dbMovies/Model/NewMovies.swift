//
//  model.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import UIKit

struct MovieData: Codable {
    let results: [Movie]?
}

struct Movie: Codable {
    let title: String?
    let image: String?
    let overview: String?
//    let vote: String?
//    let released: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case image = "poster_path"
        case overview
//        case vote = "vote_average"
//        case released = "release_date"
    }
}



