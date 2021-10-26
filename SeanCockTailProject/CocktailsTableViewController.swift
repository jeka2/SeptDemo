//
//  CocktailsTableViewController.swift
//  SeanCockTailProject
//
//  Created by Sean Jones on 10/25/21.
//

import UIKit


class CockTailsTableViewController: UITableViewController {
 //    MARK: - PROPERTIES
 let viewModel = CockTailsViewModel()

    
//     MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.closure = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.register(UINib(nibName: "DrinkCell", bundle: .main), forCellReuseIdentifier: "DrinkCell")
    }
    
    func setupUI() {
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.drinkCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as? DrinkTableViewCell else { return UITableViewCell()}
        let drink = viewModel.drinks[indexPath.row]
        cell.drinkTitleLabel.text = drink.name
       
        return cell
    }
    
    // MARK: - HELPERS
}
