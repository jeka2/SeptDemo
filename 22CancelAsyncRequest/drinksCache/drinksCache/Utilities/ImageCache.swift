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
    var imageCache: NSCache<NSString, UIImage> = NSCache()
    var runningTasks: [UUID: URLSessionTask] = [:]
    
    func read(imageStr: String) -> UIImage? {
        let nsString = imageStr as NSString
        return imageCache.object(forKey: nsString)
    }
    
    func write(imageStr: String, image: UIImage) {
        let nsString = imageStr as NSString
        imageCache.setObject(image, forKey: nsString)
    }
    
    func startFetchRequest(imageStr: String, completion: @escaping (UIImage) -> Void) -> UUID? {
        
        guard let url = URL(string: imageStr) else {
            return nil
        }
        
        let uuid = UUID()
        
        let runningTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            if let image = UIImage(data: data) {
                /// Completion
                ImageCache.shared.write(imageStr: imageStr, image: image)
                
                /// UI Update
                DispatchQueue.main.async {
                    completion(image)
                }
                
                /// 2. Task is DONE - removing from runningTasks
                self.runningTasks.removeValue(forKey: uuid)
            }
            
        }
        runningTask.resume()
        
        
        /// 1. Starting Task - Save to Dictionary of runningTasks
        /// Have to save task under the key of a uniqueID (UUID) not a string
        runningTasks[uuid] = runningTask
        return uuid
    }
}
