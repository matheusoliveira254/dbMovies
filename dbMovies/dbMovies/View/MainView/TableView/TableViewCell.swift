//
//  TableViewCell.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 8/6/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoriesLbl: UILabel!
    let viewModel1 = NewMoviesViewModel()
    var navigationController: UINavigationController?
    
    let cellIdentifier = "CollectionViewCell"
    var collectionNewMovies: [Movie] = []
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setMovies(movies: [Movie]) {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionNewMovies = movies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setCategoryLblText() {
         categoriesLbl.text = viewModel1.movieCategory
     }
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionNewMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        let popularMovies = collectionNewMovies[indexPath.row]
        cell.cellSetUp(with: popularMovies)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
            let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
            guard let movieDetailsViewController = storyboard.instantiateViewController(withIdentifier: "detailScreen") as? MovieDetailsViewController else {return}
            let selectedMovie = collectionNewMovies[indexPath.row]
            movieDetailsViewController.movie = selectedMovie
            guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { return }
            movieDetailsViewController.image = cell.getCellImage()
            self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    
            // This is how is done if we don't have the navigationController instead of the line above       self.present(movieDetailsViewController, animated: true)
    
    
            
            //    This is another way to perform the segue action after clicking cell, we would just need to add an identifier "segue1" to the storyboard reference
            //
            //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //
            //        if segue.identifier == "segue1" {
            //            guard let destination = segue.destination as? MovieDetailsViewController else { return }
            //
            //            guard let cell = sender as? MyCell else { return }
            //            guard let indexPath = myCollectionView.indexPath(for: cell) else { return }
            //            let movie = viewModel.newMovies[indexPath.row]
            //
            //            destination.movie = movie
            //            destination.image = cell.getCellImage()
            //        }
            //
            //    }
        }
    
}


