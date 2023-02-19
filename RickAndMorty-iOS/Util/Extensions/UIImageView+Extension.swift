//
//  UIImageView+Extension.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 18.02.2023.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCache(withUrl urlString : String) {
        
        let url = URL(string: urlString)
        self.image = nil

        //Control Cache Image exist or not
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }

        //Donwload Image If Not In Cache
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
        }).resume()
    }
    
    func loadImage(from url: String){
        guard let url = URL(string: url) else {return}
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
