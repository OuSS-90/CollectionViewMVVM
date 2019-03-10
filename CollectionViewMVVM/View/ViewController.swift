//
//  ViewController.swift
//  CollectionViewMVVM
//
//  Created by OuSS on 3/9/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    private let identifier = "animeCell"
    var animes = [AnimeViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.register(AnimeCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.backgroundColor = .white
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: view.layer.frame.width, height: 10)
            layout.minimumLineSpacing = 20
        }
        
        AnimeService.shared.getData { [weak self] (season) in
            self?.animes = season.anime.map{AnimeViewModel(anime: $0)}
            self?.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! AnimeCell
        cell.animeViewModel = animes[indexPath.item]
        return cell
    }

}

