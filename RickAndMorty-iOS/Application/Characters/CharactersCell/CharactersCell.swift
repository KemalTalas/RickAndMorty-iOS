//
//  CharactersCell.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 15.02.2023.
//

import UIKit

class CharactersCell: UICollectionViewCell {
    
    static let identifier = "CharactersCell"

    @IBOutlet weak var charImage: UIImageView!{
        didSet{
            charImage.contentMode = .scaleToFill
        }
    }
    
    @IBOutlet weak var charLabel: UILabel!
    
    @IBOutlet weak var mainView: UIView!{
        didSet{
            mainView.layer.cornerRadius = 20
            mainView.layer.masksToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
