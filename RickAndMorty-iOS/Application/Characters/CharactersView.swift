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
        viewModel.getCharacters()

        print(viewModel.allCharacters.count)
        print(viewModel.exampleName)
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
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me!")
    }
}

extension CharactersView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCell.identifier, for: indexPath) as! CharactersCell
        cell.charImage.image = UIImage(named: "empty")
        return cell
    }
    
    
}

extension CharactersView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
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


