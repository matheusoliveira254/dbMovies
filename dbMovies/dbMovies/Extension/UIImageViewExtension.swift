//
//  UIImageViewExtension.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 7/18/22.
//

import UIKit

extension UIImageView {
    
    func loadImageFrom(url: String) {
        
        guard let url = URL(string: url) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "GTR 1")
                }
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
    }
}
