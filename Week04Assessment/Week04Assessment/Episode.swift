//
//  Episode.swift
//  Week04Assessment
//
//  Created by Luat on 10/25/21.
//

import Foundation

struct EpisodeModel: Decodable {
    let _embedded: EmbeddedEpisodes
}

struct EmbeddedEpisodes: Decodable {
    let episodes: [EpisodeItem]
}

struct EpisodeItem: Decodable {
    let season: Int
    let number: Int
    let summary: String
    let name: String
}
