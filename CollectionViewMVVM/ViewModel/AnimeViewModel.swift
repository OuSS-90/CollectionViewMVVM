//
//  AnimeViewModel.swift
//  CodableTuto
//
//  Created by OuSS on 2/28/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import Foundation

struct AnimeViewModel {
    let title: String
    let imageUrl: String
    let synopsis: String
    
    init(anime: Anime) {
        title = anime.title
        imageUrl = anime.imageUrl
        synopsis = anime.synopsis
    }
}
