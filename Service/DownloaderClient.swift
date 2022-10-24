//
//  DownloaderClient.swift
//  InvioFilm
//
//  Created by Furkan Deniz Albaylar on 19.10.2022.
//

import Foundation

class DownloaderClient {
    func filmleriIndir(search: String, completion: @escaping (Result<[Film]?,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=6149f618") else {
            return completion(.failure(.yanlisUrl))
        }
        URLSession.shared.dataTask(with: url) { data,response,error in
            guard let data = data , error == nil
            else {
                return completion(.failure(.veriGelmedi))
            }
            guard let filmCevabı = try? JSONDecoder().decode(GelenFimler.self, from: data)
            else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(filmCevabı.filmler))
        }.resume()
    }
    
    func filmDetayiniIndir(imdbId : String, completion : @escaping (Result<FilmDetayii,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=6149f618") else {
            return completion(.failure(.yanlisUrl))
        }
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data , error == nil
            else {
                return completion(.failure(.veriGelmedi))
            }
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetayii.self, from: data)
            else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(gelenFilmDetayi))
        }.resume()
    }
        
}
    
    

            
enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}
