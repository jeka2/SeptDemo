//
//  ViewController.swift
//  ImageCache
//
//  Created by Yevgeniy Ivanov on 10/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CocktailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpBind()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CellView", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: CellView.identifier)
    }
    
    func setUpBind() {
        viewModel.bindTableReload {
            self.tableView.reloadData()
        }
    }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellView.identifier, for: indexPath) as? CellView {
            cell.setUp(drink: viewModel.getItemAt(row: indexPath.row)!)
            cell.setImage(url: viewModel.getItemAt(row: indexPath.row)!.imageStr)
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ViewController : UITableViewDelegate {
    
}
