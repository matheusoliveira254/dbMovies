//
//  ViewController.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import UIKit


class MovieDisplayViewController: UIViewController  {
   
    //MARK: IBOutlet
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: Properties
    let viewModel = NewMoviesViewModel()
    let detailsViewController = MovieDetailsViewController()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       setUI()
    }
    
    
    //MARK: IBActions
    
    
    
    //MARK: Methods
    func networkCall() {
        viewModel.fetchPopularMovies { isCompleted in
            if isCompleted {
                DispatchQueue.main.async {
                    self.myCollectionView.reloadData()
                }
            }
        }
    }
    
    func setUI() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.collectionViewLayout = UICollectionViewFlowLayout()

        
        
        networkCall()
    }

}

extension MovieDisplayViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.newMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath) as! MyCell
        let popularMovies = viewModel.newMovies[indexPath.row]
        cell.cellSetUp(with: popularMovies)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 300)
       }

//    This is another way to perform the segue action after clicking cell, we would just need to add an identifier "segue1" to the storyboard
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

extension MovieDisplayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        guard let movieDetailsViewController = storyboard.instantiateViewController(withIdentifier: "detailScreen") as? MovieDetailsViewController else {return}
        let selectedMovie = viewModel.newMovies[indexPath.row]
        movieDetailsViewController.movie = selectedMovie
        guard let cel = myCollectionView.cellForItem(at: indexPath) as? MyCell else { return }
        movieDetailsViewController.image = cel.getCellImage()
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
        
        // This is how is done if we don't have the navigationController instead of the line above       self.present(movieDetailsViewController, animated: true)

        
    }
}
