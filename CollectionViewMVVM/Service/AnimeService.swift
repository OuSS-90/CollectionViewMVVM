//
//  AnimeService.swift
//  CollectionViewMVVM
//
//  Created by OuSS on 3/9/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import Foundation

class AnimeService {
    
    static let shared = AnimeService()
    let baseURL = "https://api.jikan.moe/v3/"
    
    func getData(completion: @escaping (_ season: Season) -> Void){
        
        guard let url = URL(string: baseURL + "season/2019/winter") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let season = try JSONDecoder().decode(Season.self, from: data)
                DispatchQueue.main.async {
                    completion(season)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
