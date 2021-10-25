//
//  MyCell.swift
//  Week04Assessment
//
//  Created by Luat on 10/25/21.
//

import UIKit

class MyCell: UICollectionViewCell {

    static let identifier = String(describing: MyCell.self)
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var botLeftLabel: UILabel!
    @IBOutlet weak var botRightLabel: UILabel!

    func configure(model: EpisodeItem?) {
        guard let model = model else { return }
        topLabel.text = model.name
        midLabel.text = removePreSubFixes(string: model.summary)
        botLeftLabel.text = "Season: " + String(model.season)
        botRightLabel.text = "Epi: " + String(model.number)
    }
    
    func removePreSubFixes(string: String) -> String {
        var trimmed = string
        let preSuffixes = [
            "<p>",
            "</p>"
        ]
        preSuffixes.forEach { fixes in
            trimmed = trimmed.replacingOccurrences(of: fixes, with: "")
        }
        return trimmed
    }

}
