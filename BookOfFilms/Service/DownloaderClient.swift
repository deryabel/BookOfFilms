//
//  DownloaderClient.swift
//  BookOfFilms
//
//  Created by Derya Bel on 26.12.2021.
//

import Foundation
import UIKit

class DownloaderClient {
    
    func filmleriIndir(search:String, completion: @escaping (Result<[Film]?,DownloaderError>)-> Void){
        guard let url = URL(string: "https://www.omdbapi.com/?\(search)&apikey=dabda05b&#") else {
            return completion(.failure(.yanlisUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data)else{
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(filmCevabi.filmler))
            
        }.resume()
        
    }
}

enum DownloaderError: Error{
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}
