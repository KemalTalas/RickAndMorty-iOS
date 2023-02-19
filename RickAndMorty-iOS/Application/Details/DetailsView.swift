//
//  DetailsView.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 18.02.2023.
//

import UIKit

class DetailsView: UIViewController {
    
    var isCollapsed : Bool = true

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var episodesButton: UIButton!
    
    let viewModel = DetailsViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        //setupUI()
        tableView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO: Yarın Single characteri detailviewmodela atmayı dene orda işlemleri halledip buraya aktar. Sonra da tableview'ı hallet
        setupUI()
        print(viewModel.characterId)

        print(viewModel.episodeArray)
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: EpisodeCell.identifier)
        
        
    }
    
    func setupUI(){
        detailImageView.loadImageUsingCache(withUrl: viewModel.singleChar?.image ?? "empty")
        statusLabel.text?.append(viewModel.singleChar?.status ?? "unknown")
        speciesLabel.text?.append(viewModel.singleChar?.species ?? "unknown")
        genderLabel.text?.append(viewModel.singleChar?.gender ?? "unknown")
        originLabel.text?.append(viewModel.singleChar?.origin?.name ?? "unknown")
        locationLabel.text?.append(viewModel.singleChar?.location?.name ?? "uknown")
        detailImageView.layer.cornerRadius = 20
        detailImageView.loadImage(from: viewModel.detailImage)
        title = viewModel.singleChar?.name ?? "Unknown"
        tableView.layer.cornerRadius = 6
        tableView.layer.masksToBounds = true
        viewModel.getEpisodes()
    }
    

    @IBAction func episodeButtonTapped(_ sender: UIButton) {
        if isCollapsed{
            episodesButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            isCollapsed = false
            tableView.isHidden = false
        }else {
            episodesButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            isCollapsed = true
            tableView.isHidden = true
            
        }
        print(viewModel.array.count)
    }

}

extension DetailsView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier, for: indexPath) as! EpisodeCell
        cell.backgroundColor = UIColor.systemGray6
        cell.tintColor = UIColor.systemGray6
        cell.episodeNameLabel.text = viewModel.array[indexPath.row].name ?? ""
        cell.episodeLabel.text = viewModel.array[indexPath.row].episode ?? ""
        return cell
    }
    
    
}
