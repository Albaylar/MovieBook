//
//  FilmDetayViewModel.swift
//  InvioFilm
//
//  Created by Furkan Deniz Albaylar on 22.10.2022.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetail : FilmDetaylariViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId : String) {
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let FilmDetay):
                DispatchQueue.main.async {
                    self.filmDetail = FilmDetaylariViewModel(detay: FilmDetay)
                }
                
            }
        }
    }
}
struct FilmDetaylariViewModel {
    
    let detay : FilmDetayii
    
    var title : String {
        detay.title
    }
    var poster : String {
        detay.poster
    }
    var year : String {
        detay.year
    }
    var imdbId : String {
        detay.imdbId
    }
    var director : String {
        detay.director
    }
    var writer : String {
        detay.writer
    }
    var awards : String {
        detay.awards
    }
    var plot : String {
        detay.plot
    }
    var imdbRating : String {
        detay.imdbRating
    }
    var genre : String {
        detay.genre
    }
}
