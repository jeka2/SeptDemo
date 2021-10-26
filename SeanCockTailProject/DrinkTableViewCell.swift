//
//  DrinkTableViewCell.swift
//  SeanCockTailProject
//
//  Created by Sean Jones on 10/25/21.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    //MARK: - PROPERTIES

    let drinkImageView: UIImageView = {
        let iv = UIImageView()
        return iv
        
    }()
    
    let drinkTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    //MARK: - LIFECYCLE
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - HELPERS
    
    func setupSubViews() {
        
        contentView.addSubview(drinkImageView)
        drinkImageView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, left: contentView.safeAreaLayoutGuide.leftAnchor, paddingTop: 20, paddingLeft: 20, width: 100, height: 100)
        contentView.addSubview(drinkTitleLabel)
        drinkTitleLabel.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, left: drinkTitleLabel.leftAnchor,paddingTop: 20, paddingLeft: 20)
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
