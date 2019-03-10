//
//  UIImageView+Cache.swift
//  streamapp
//
//  Created by Brian Voong on 7/29/16.
//  Copyright © 2016 luxeradio. All rights reserved.
//

import UIKit

/**
 A convenient UIImageView to load and cache images.
 */
class CustomImageView: UIImageView {
    
    var imageCache = [String:UIImage]()
    var lastImageURL: String?
    
    func loadImage(imageUrl: String?) {
        guard let imageUrl = imageUrl else { return }
        
        lastImageURL = imageUrl
        image = nil
        
        if let image = imageCache[imageUrl] {
            self.image = image
            return
        }
        
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to retrieve image", error)
            }
            
            guard let data = data else { return }
            if url.absoluteString != self.lastImageURL { return }
            
            let image = UIImage(data: data)
            self.imageCache[url.absoluteString] = image
            
            DispatchQueue.main.async {
                self.image = image
            }
            }.resume()
    }
}
