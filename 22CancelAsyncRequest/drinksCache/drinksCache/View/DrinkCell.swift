//
//  DrinkCell.swift
//  drinksCache
//
//  Created by Luat on 8/23/21.
//

import UIKit

class DrinkCell: UITableViewCell {

    static let identifier = String(describing: DrinkCell.self)
    
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkDesc: UILabel!
    @IBOutlet weak var drinkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drinkName.text = "test name"
        drinkDesc.text = "test desc"
    }
    
    var onReuse: () -> Void = {}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        /// Removes previous (outdated) running tasks
        onReuse()
        drinkImageView.image = nil
    }
    
    
    
//    var localCount: Int?
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        globalCount += 1
//        if localCount == nil {
//            localCount = globalCount
//        }
//        print("reusing cell global \(globalCount)")
//        print("reusing cell local \(localCount!)")
//    }
}

//var globalCount = 0
