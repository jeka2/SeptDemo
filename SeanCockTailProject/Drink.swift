//
//  Drink.swift
//  SeanCockTailProject
//
//  Created by Sean Jones on 10/25/21.
//

import Foundation


struct DrinkResponse: Codable {
    let drinks:[DrinkItem]
}

struct DrinkItem: Codable {
    
        enum CodingKeys: String, CodingKey{
            case name = "strDrink"
            case thumbnail = "strDrinkThumb"
        }
        
    let name: String
    let thumbnail: String
    
    }

