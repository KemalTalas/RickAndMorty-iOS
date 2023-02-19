//
//  EpisodeCell.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 19.02.2023.
//

import UIKit

class EpisodeCell: UITableViewCell {

    static let identifier = "EpisodeCell"
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
