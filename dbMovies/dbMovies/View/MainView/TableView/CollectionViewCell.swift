//
//  TableViewCell.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 8/4/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieCellImage: UIImageView!    
    @IBOutlet weak var movieCellLbl: UILabel!
    
    
    func cellSetUp(with movie: Movie) {
        movieCellImage.loadImageFrom(imageEndPoint: movie.image ?? "")
        movieCellLbl.text = movie.title
    }
    
    func getCellImage() -> UIImage? {
        return movieCellImage.image
    }
}


