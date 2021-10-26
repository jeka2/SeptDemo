//
//  ImageCache.swift
//  SeanCockTailProject
//
//  Created by Sean Jones on 10/26/21.
//

import UIKit


class ImageCache: NSCache<NSString,UIImage> {
    static let shared = ImageCache()
    
    func fetch(drink: DrinkItem) {
        var key = NSString(string: drink.name)
        var value: UIImage
        CockTailsViewModel.fetchDrinkThumbnail(for: drink){ (result) in
            switch result{
            case .success(let image):
                let value = image
                self.write(key: key, for: value)
                
            case.failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
        
        
    }
    
    func write(key: NSString, for value: UIImage){
        
        
        
    }
}
