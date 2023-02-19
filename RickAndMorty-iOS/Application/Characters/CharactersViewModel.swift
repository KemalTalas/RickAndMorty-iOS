//
//  CharactersViewModel.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 16.02.2023.
//

import Foundation

protocol CharactersViewModelDelegate : AnyObject {
    func didUpdateCharacters(data: [SingleCharacter])
    func didFailWithError(_ error: Error)
}

class CharactersViewModel  {
 
//    private let delegate : DataReachedDelegate
    var allCharacters : [SingleCharacter] = []
    var exampleName : String = "Boş"
    weak var delegate : CharactersViewModelDelegate?
    private var pageNumber : Int = 1
    
//    init(delegate: CharactersViewModelDelegate) {
//        self.delegate = delegate
//    }
    
    func getCharacters(isPagination : Bool){
        
        if isPagination{
            pageNumber += 1
        }
        
        ApiClient.shared.fetch(urlString: "\(Constants.Network.charactersURL)\(pageNumber)") { (result: Result<AllCharacters, Error>) in
            switch result {
            case .success(let allChars):
                guard let allChars = allChars.results else {return}
                self.allCharacters.append(contentsOf: allChars)
                self.exampleName = "Oldu"
                self.delegate?.didUpdateCharacters(data: self.allCharacters)
            case .failure(let error):
                print("Error : \(error.localizedDescription)")
                self.exampleName = "Olmadı"
                self.delegate?.didFailWithError(error)
            }
        }
    }
    
}
