//
//  DetailsViewModel.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 18.02.2023.
//

import Foundation

protocol DetailsViewModelDelegate : AnyObject {
    func didUpdateDetails(data: AllCharacters)
    func didFailWithError(_ error: Error)
}

class DetailsViewModel {
    
    let a = CharactersViewModel().allCharacters
    
    weak var delegate : DetailsViewModelDelegate?
    var singleChar : SingleCharacter?
    var characterId : Int = 1
    var charName : String = ""
    var gender : String = ""
    var species : String = ""
    var status : String = ""
    var origin : String = ""
    var location : String = ""
    var detailImage : String = ""
    var episodeArray : [String] = []
    var array : [AllCharacters] = []
    
    func getEpisodes(){
        episodeArray = singleChar?.episode ?? []
        if(episodeArray.count>0){
            for episode in episodeArray {
                ApiClient.shared.fetch(urlString: episode) { (result: Result<AllCharacters, Error>) in
                    switch result {
                    case .success(let episode):
                        if episode.error == nil{
                            self.array.append(episode)
                            self.delegate?.didUpdateDetails(data: episode)
                        }
                        
                    case .failure(let error):
                        print("Error : \(error.localizedDescription)")
                        self.delegate?.didFailWithError(error)
                    }
                }
            }
        }
        }
    }

