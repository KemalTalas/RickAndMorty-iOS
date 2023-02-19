//
//  DetailsViewModel.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 18.02.2023.
//

import Foundation

class DetailsViewModel {
    
    let a = CharactersViewModel().allCharacters
    
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
    
    
}
