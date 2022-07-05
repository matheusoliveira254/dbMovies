//
//  ViewController.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 6/23/22.
//

import UIKit


var fetchedMovies = ["Top Gun", "Encanto", "What is a Woman", "LightYear", "Guy", "2000 Mules"]

class MovieDisplayViewController: UIViewController  {
   
    //MARK: IBOutlet
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: Properties
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View Did Disappear")
    }
    
    //MARK: IBActions
    
    //MARK: Methods


}

extension MovieDisplayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellId", for: indexPath) as! MyCell
        
        
        cell.myButton.titleLabel?.text = fetchedMovies[indexPath.row]
        
        return cell
    }
    
}
