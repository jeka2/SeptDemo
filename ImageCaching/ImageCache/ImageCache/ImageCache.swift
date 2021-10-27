//
//  ImageCache.swift
//  ImageCache
//
//  Created by Yevgeniy Ivanov on 10/27/21.
//

import UIKit

class ImageCache {
    static var shared = ImageCache()
    
    var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    private init() {}
    
    func read(key: String) -> UIImage? {
        let nsString = key as NSString
        return imageCache.object(forKey: nsString)
    }
    
    func write(key: String, image: UIImage) {
        let nsString = key as NSString
        imageCache.setObject(image, forKey: nsString)
    }
    
}
