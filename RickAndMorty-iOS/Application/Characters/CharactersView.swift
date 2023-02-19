//
//  CharactersView.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 15.02.2023.
//

import UIKit

class CharactersView: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = CharactersViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.delegate = self
        viewModel.getCharacters(isPagination: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CharactersCell", bundle: nil), forCellWithReuseIdentifier: CharactersCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
        
        title = "Characters"

    }

}

extension CharactersView : CharactersViewModelDelegate{
    func didUpdateCharacters(data: [SingleCharacter]) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    
}

extension CharactersView : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "detailsview") as! DetailsView
        vc.viewModel.singleChar = viewModel.allCharacters[indexPath.row].self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == viewModel.allCharacters.count - 1 {
            viewModel.getCharacters(isPagination: true)
        }
        
    }
}

extension CharactersView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.allCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCell.identifier, for: indexPath) as! CharactersCell
        cell.charImage.image = UIImage(named: "empty")
        cell.charLabel.text = viewModel.allCharacters[indexPath.row].name
        

        
        cell.charImage.loadImage(from: viewModel.allCharacters[indexPath.row].image ?? "empty")
        //cell.charImage.loadImageUsingCache(withUrl: viewModel.allCharacters[indexPath.row].image ?? "empty")
        return cell
    }
    
    
}

extension CharactersView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 30)/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10,
                            left: 10,
                            bottom: 10,
                            right: 10)
    }
}

extension UIImageView{

}
