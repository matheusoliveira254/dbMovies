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
    
}
