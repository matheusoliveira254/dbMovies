//
//  UIImageViewExtension.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 7/18/22.
//

import UIKit

extension UIImageView {
    
    
    func loadImageFrom(imageEndPoint: String) {
        let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
        
        guard var url = URL(string: imageBaseURL) else {return}
        url.appendPathComponent(imageEndPoint)
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
            
            if let _ = error {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "GTR 1")
                }
            }
        }
        dataTask.resume()
    }
}
