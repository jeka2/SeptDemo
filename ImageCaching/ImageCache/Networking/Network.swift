//
//  Network.swift
//  ImageCache
//
//  Created by Yevgeniy Ivanov on 10/26/21.
//

import UIKit

class Network {
    static var shared = Network()
    private init() {}
    
    func fetchCoctails(completion: @escaping (Response) -> ()){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { d, _, _ in
            guard let data = d else { return }
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                
                completion(response)
            } catch {
                print("error has occured")
            }
        }.resume()
    }
    
    func fetchCoctailImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { d, _, _ in
            guard let data = d else { return }
            if let image = UIImage(data: data) {
                ImageCache.shared.write(key: urlString, image: image)
                completion(image)
            } else {
                print("Something went wrong with fetching the image")
            }
        }.resume()
    }
}
