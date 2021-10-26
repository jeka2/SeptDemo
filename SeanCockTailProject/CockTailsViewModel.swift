//
//  CockTailsViewModel.swift
//  SeanCockTailProject
//
//  Created by Sean Jones on 10/25/21.
//

import UIKit


class CockTailsViewModel {
    let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail")
    
    var drinks: [DrinkItem] = []
    var drinkCount: Int {
        drinks.count
    }
    var closure: () -> Void = {}
    
    
    init() {
        fetchCockTails(){ (result) in
            switch result {
            case .success(let drinks):
                self.drinks = drinks
                self.getImages()
                self.closure()
            case .failure(let error):
                print(error.localizedDescription)
            }
           
        }
    }
    
    func fetchCockTails(completion:  @escaping (Result<[DrinkItem], DrinkError>) -> Void) {
        guard let baseURL = baseURL else {
            return completion(.failure(.invalidURL))
        }

        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error  {return completion(.failure(.thrown(error)))}
            guard let data = data else {return completion(.failure(.noData))}
            do{
                let drinks = try JSONDecoder().decode(DrinkResponse.self, from: data)
                completion(.success(drinks.drinks))
            }
            catch{
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
        }.resume()
    }
    
    static func fetchDrinkThumbnail(for drink: DrinkItem, completion: @escaping (Result<UIImage, DrinkError>) -> Void){
        
        guard let drinkThumbnailURL = URL(string: drink.thumbnail) else {return completion(.failure(.noData))}
        
        
        URLSession.shared.dataTask(with: drinkThumbnailURL) { (data, _, error) in
        
            if let error = error{ completion(.failure(.thrown(error)))}
            guard let data = data else {return completion(.failure(.noData))}
            guard let image = UIImage(data: data) else { return completion(.failure(.noData))}
            completion(.success(image))
        }.resume()
        
    }
    
    func getImages() {
        for drink in drinks {
            ImageCache.shared.fetch(drink: drink)
        }
    }
}
