//
//  CocktailModel.swift
//  ImageCache
//
//  Created by Yevgeniy Ivanov on 10/26/21.
//

import Foundation

struct Response : Codable {
    let drinks : [Drink]
}

struct Drink : Codable {
    enum CodingKeys : String, CodingKey {
        case name = "strDrink"
        case imageStr = "strDrinkThumb"
        case idDrink
    }
    
    let name: String
    let imageStr: String
    let idDrink : String
}
