//
//  EpisodeViewModel.swift
//  Week04Assessment
//
//  Created by Luat on 10/25/21.
//

import Foundation

class EpisodeViewModel {
    var episodes: EpisodeModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    var updateUI: (() -> Void)?
    var networkService = NetworkService()
    
    init() {
        networkService.fetchEpisodes { episodes in
            self.episodes = episodes
        }
    }
    
    func bind(closure: @escaping () -> Void) {
        updateUI = closure
    }
    
    var numRows: Int {
        episodes?._embedded.episodes.count ?? 0
    }
    
    func getModel(row: Int) -> EpisodeItem? {
        episodes?._embedded.episodes[row]
    }
}
