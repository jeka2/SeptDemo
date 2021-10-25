//
//  NetworkService.swift
//  Week04Assessment
//
//  Created by Luat on 10/25/21.
//

import Foundation

struct NetworkService {
    let url = URL(string: "https://api.tvmaze.com/singlesearch/shows?q=game%20of%20thrones&embed=episodes")
    
    func fetchEpisodes(completion: @escaping (EpisodeModel) -> Void) {
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, r, e in
                guard let data = data else { return }
                do {
                    let decoded = try JSONDecoder().decode(EpisodeModel.self, from: data)
                    completion(decoded)
                } catch {
                    print("error")
                }
            }.resume()
        }
    }
}
