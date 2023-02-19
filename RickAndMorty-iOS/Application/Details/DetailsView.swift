//
//  DetailsView.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 18.02.2023.
//

import UIKit

class DetailsView: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = DetailsViewModel()
    let viewModel2 = CharactersViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        //setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO: Yarın Single characteri detailviewmodela atmayı dene orda işlemleri halledip buraya aktar. Sonra da tableview'ı hallet
        setupUI()
        print(viewModel.characterId)

        print(viewModel.episodeArray)
        
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
