//
//  MyCell.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    func cellSetUp(with movie: Movie) {
        cellImage.loadImageFrom(imageEndPoint: movie.image ?? "")
        myLbl.text = movie.title
    }
    
    func getCellImage() -> UIImage? {
        return cellImage.image
    }
}
