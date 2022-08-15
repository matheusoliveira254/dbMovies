//
//  TableViewController.swift
//  dbMovies
//
//  Created by Matheus Oliveira on 8/4/22.
//

import UIKit

class TableViewController: UITableViewController {

    //MARK: - IBoutlets
    
    
    //MARK: - Properties
    let viewModel = NewMoviesViewModel()
    let detailsViewController = MovieDetailsViewController()
    
    //MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        }

    //MARK: IBActions
    
    
    //MARK: Methods
    func networkCall() {
        viewModel.fetchNewMovies { isCompleted in
            if isCompleted {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func setUI() {
        networkCall()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
        
        let movies = viewModel.newMovies
        cell.setCategoryLblText()
        cell.setMovies(movies: movies)
        cell.navigationController = self.navigationController
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
