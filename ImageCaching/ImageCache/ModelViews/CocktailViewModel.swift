//
//  CocktailViewModel.swift
//  ImageCache
//
//  Created by Yevgeniy Ivanov on 10/26/21.
//

import UIKit

class CocktailViewModel {
    
    var coctails: Response? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    let network = Network.shared
    var updateUI: (()->())?
    
    var numberOfRows: Int {
        self.coctails?.drinks.count ?? 0
    }
    
    init() {
        network.fetchCoctails { coctails in
            self.coctails = coctails
        }
    }
    
    func bindTableReload(closure: @escaping () -> ()) {
        updateUI = closure
    }
    
    func getItemAt(row: Int) -> Drink? {
        self.coctails?.drinks[row]
    }
    
}
