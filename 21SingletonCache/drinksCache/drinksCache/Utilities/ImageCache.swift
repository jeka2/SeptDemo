//
//  ImageCache.swift
//  drinksCache
//
//  Created by Luat on 8/23/21.
//

import UIKit

/// Todo: Save each image

class ImageCache {
    
    static let shared = ImageCache()
    private init() {}
    
//    var images: [String: UIImage] = [:]
    var nsCache: NSCache<NSString, UIImage> = NSCache()
    
    func read(imageStr: String) -> UIImage? {
        let nsString = imageStr as NSString
        return nsCache.object(forKey: nsString)
    }
    
    func write(imageStr: String, image: UIImage) {
        let nsString = imageStr as NSString
        nsCache.setObject(image, forKey: nsString)
    }
    
}
