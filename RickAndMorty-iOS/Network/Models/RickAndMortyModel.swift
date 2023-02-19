//
//  File.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 16.02.2023.
//

import Foundation

struct AllCharacters : Codable{
    let results : [SingleCharacter]?
    let info : Info?
    let error : String?
}

struct SingleCharacter : Codable {
    let id : Int?
    let name : String?
    let status : String?
    let species : String?
    let type : String?
    let gender : String?
    let image : String?
    let origin : Origin?
    let location : Origin?
    let episode : [String]?
}

struct Origin : Codable {
    let name : String?
    let url : String
}

struct Info : Codable {
    let count : Int?
    let pages : Int?
    let next : String?
    let prev : String?
}
