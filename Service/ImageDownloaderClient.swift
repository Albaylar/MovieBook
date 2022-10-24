//
//  ImageDownloaderClient.swift
//  InvioFilm
//
//  Created by Furkan Deniz Albaylar on 21.10.2022.
//

import Foundation

class ImageDownloaderClient : ObservableObject {
    
    @Published var indirilenImage : Data?
    
    func gorselIndir( url : String) {
        guard let imageUrl = URL(string: url) else {
             return
            }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.indirilenImage = data
            }
        }.resume()
        }
        
    }

    

