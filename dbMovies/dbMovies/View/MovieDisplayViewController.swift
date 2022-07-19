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
    let viewModel = PopularViewModel()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDid Load")
        myCollectionView.dataSource = self
        
        self.view.layoutIfNeeded()
        let itemsPerRow = 3
        let cellWidth = self.myCollectionView.bounds.width / CGFloat(itemsPerRow)
        
        let myLayout = UICollectionViewFlowLayout()
        myLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        myLayout.sectionInset = UIEdgeInsets.zero
        myLayout.minimumLineSpacing = 5.0
        myLayout.minimumInteritemSpacing = 0.0
        
        myCollectionView.collectionViewLayout = myLayout
        
    }
    
    
    //MARK: IBActions
    
    
    
    //MARK: Methods


}

extension MovieDisplayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.popular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellId", for: indexPath) as! MyCell
        
        cell.myButton.titleLabel = Movie.title
        
        return cell
    }
    
}
