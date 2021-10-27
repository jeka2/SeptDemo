//
//  CellView.swift
//  ImageCache
//
//  Created by Yevgeniy Ivanov on 10/26/21.
//

import UIKit

class CellView : UITableViewCell {
    
    static let identifier = "MyCell"
    let network = Network.shared
    
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var cocktailImageView: UIImageView!
    
    func setUp(drink: Drink) {
        labelView.text = drink.name
    }
    
    func setImage(url: String) {
        if let image = ImageCache.shared.read(key: url) {
            self.cocktailImageView.image = image
        } else {
            network.fetchCoctailImage(urlString: url) { image in
                DispatchQueue.main.async {
                    self.cocktailImageView.image = image
                }
            }
        }
    }
    
}
