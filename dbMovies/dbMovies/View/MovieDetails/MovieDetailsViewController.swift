//
//  MovieDetailsViewController.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 7/29/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    let dataViewModel = NewMoviesViewModel()
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsMovieTitle: UILabel!   
    @IBOutlet weak var detailsMovieOverviewLbl: UILabel!
    
    var movie: Movie?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        if let movie = movie, let image = image {
            self.detailsImageView.image = image
            self.detailsMovieTitle.text = movie.title
            self.detailsMovieOverviewLbl.text = movie.overview
        }
    }
}
