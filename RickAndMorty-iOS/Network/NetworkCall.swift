//
//  NetworkCall.swift
//  RickAndMorty-iOS
//
//  Created by Kemal Burak Talas on 16.02.2023.
//

import Foundation

protocol DataReachedProtocol{
    func dataReached(data: [SingleCharacter])
    func errorReached(error: Error)
}

class NetworkCall{
    
    static let shared = NetworkCall()
    static var allCharacters : [SingleCharacter] = []
    
    let baseURL = "https://rickandmortyapi.com/api/character"
    var delegate : DataReachedProtocol?
    
    func performRequest(){
        if let url = URL(string: "https://rickandmortyapi.com/api/character"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    //self.delegate?.errorReached(error: error!)
                }
                if let safeData = data {
                    do{
                        let result = try JSONDecoder().decode(AllCharacters.self, from: safeData)
                        print(result.results?[0].name)
                    }catch{
                        //self.delegate?.errorReached(error: error)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func getData<S: Codable>(expecting : S.Type, completion: @escaping(Result<S,Error>)->Void){
        let task = URLSession.shared.dataTask(with: URL(string: baseURL)!) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    }



